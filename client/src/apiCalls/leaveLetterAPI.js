import axios from "axios";
import { getCookie } from "tiny-cookie";
import { SERVER_HOST_DEV } from "../constants/api";
import { ACCESS_TOKEN_KEY } from "../constants/token";

export const getLeaveLetterDetails = id =>
  axios.get(`${SERVER_HOST_DEV}/leaveLetter/details?id=${id}`, {
    headers: {
      "x-access-token": getCookie(ACCESS_TOKEN_KEY)
    }
  });