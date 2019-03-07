const express = require("express");
const Router = express.Router();

/**
 * Models
 */
const { users: userModel } = require("../../models");

/**
 * Helpers
 */
const {
  handleSuccess,
  handleFailure
} = require("../../helpers/handleResponse");
const { standardizeObj } = require("../../helpers/standardize");
const {
  getIdFromToken,
  getPermissionByUserId
} = require("../../helpers/getUserInfo");

// Get user profile
Router.get("/profile", async (req, res) => {
  try {
    const ownUserId = getIdFromToken(req.token_payload);
    if (!ownUserId) throw { msg: "USER_NOT_FOUND" };
    const demandUserId = req.params.id;
    if (!demandUserId) throw { msg: "USER_NOT_FOUND" };

    // Admin and HR can view profile of everyone
    // Others can view oneself's
    const fUserType = await getPermissionByUserId(userId);
    if (
      !fUserType ||
      (fUserType !== "Administration" &&
        fUserType !== "HR" &&
        ownUserId !== demandUserId)
    )
      throw { code: 401, msg: "NO_PERMISSION" };

    const attributes = [
      "fAddress",
      "fBday",
      "fEmail",
      "fFirstName",
      "fLastName",
      "fPhone",
      "fPosition",
      "fTeamId",
      "fTypeId",
      "fUsername",
      "fGender"
    ];
    const user = await userModel.loadAll(attributes, { where: { fId } });
    if (!user || (user && user.length !== 1)) throw { msg: "USER_NOT_FOUND" };
    handleSuccess(res, { user: user[0] });
  } catch (err) {
    handleFailure(res, { err, route: req.originalUrl });
  }
});

// Get user id
Router.get("/id", (req, res) => {
  const userId = getIdFromToken(req.token_payload);
  if (userId)
    handleSuccess(res, {
      userId
    });
  else {
    const err = { msg: "USER_NOT_FOUND" };
    handleFailure(res, { err, route: req.originalUrl });
  }
});

// Update user profile
Router.patch("/profile", async (req, res) => {
  try {
    const userId = getIdFromToken(req.token_payload);
    if (!userId) throw { msg: "USER_NOT_FOUND" };

    const keys = Object.keys(req.body);
    if (
      keys.length < 2 ||
      !keys.includes("info") ||
      (keys.includes("info") && Object.keys(req.body.info) < 1)
    )
      throw { msg: "INVALID_VALUES" };
    const entity = req.body.info && standardizeObj(req.body.info);

    // validate whether userPermission is permitted
    // only Admin can edit profile
    const fUserType = await getPermissionByUserId(userId);
    if (fUserType !== "Administration")
      throw { cod: 401, msg: "NO_PERMISSION" };

    // validate gender value
    const { fGender, fBDay } = entity;
    if (
      (fGender || 3) &&
      !userModel.rawAttributes.fGender.values.includes(fGender)
    )
      throw { msg: "INVALID_VALUES" };

    // validate birthday value
    if (fBDay && new Date(fBDay) >= new Date()) throw { msg: "INVALID_VALUES" };

    // update foreign keys
    const { fTeamId, fPositionId, fTypeId } = entity;
    if (fTeamId) entity.teams_fId = fTeamId;
    if (fPositionId) entity.positions_fId = fPositionId;
    if (fTypeId) entity.userPermission_fId = fTypeId;

    const affected = await userModel.modify(entity, {
      where: { fId: userId }
    });
    if (affected[0] !== 1) throw { msg: "USER_NOT_FOUND" };

    handleSuccess(res, { user: entity });
  } catch (err) {
    handleFailure(res, { err, route: req.originalUrl });
  }
});

module.exports = Router;