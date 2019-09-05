const express = require('express');
const Router = express.Router();

const {
  bookings: bookingModel
} = require('../../models');


Router.get('/', async (req, res) => {
  try {
    const bookings = await bookingModel.loadAll([], {})
    let entityBookings = [];
    bookings.forEach(booking => {
      entityBookings.push(booking.dataValues)
    });

    res.status(200).json({
      success: true,
      bookings
    });
  } catch (err) {
    res.status(500).json({
      error: true,
      message: err
    });
  }
})

Router.post('/', async (req, res) => {
  try {
    let errors = {};

    !req.body.fBookingName || req.body.fBookingName === ''  ? errors.bookingName = 'fBookingName is not null' : ''
    !req.body.fBookingDate || req.body.fBookingDate === '' ? errors.bookingDate = 'fBookingDate is not null' : ''
    !req.body.fStartTime || req.body.fStartTime === '' ? errors.startTime = 'fStartTime is not null' : ''
    !req.body.fEndTime || req.body.fEndTime === '' ? errors.endTime = 'fEndTime is not null' : ''

    if(Object.keys(errors).length < 1){
      if(req.body.id){
        delete req.body.id;
      }
      // call API Booking.add
      const booking = await bookingModel.add(req.body);

      res.status(200).json({
        success: true,
        booking: req.body
      })
    }else{
      res.status(400).json({
        error: true,
        errors
      })
    }
  } catch (err) {
    res.status(400).json({
      error: true,
      message: err
    }) 
  }
})

Router.get('/detail/:id', async (req, res) => {
  try {
    const bookings = await bookingModel.loadAll([], {where: {id: req.params.id}})
    res.status(200).json({
      success: true,
      booking: bookings[0].dataValues
    })      
  } catch (err) {
    res.status(500).json({
      error: true,
      message: err 
    })
  }
})

Router.get('/detailInDate/:paramDate', async (req, res) => {
  try {
    const bookings = await bookingModel.loadAll([], {where: {fBookingDate: req.params.paramDate}});
    res.status(200).json({
      success: true,
      bookings
    })
  } catch (err) {
    res.status(500).json({
      error: true,
      message: err 
    })
  }
})

Router.get('/page/:page/limit/:limit', async (req, res) => {
  try {
    const start = (+req.params.page - 1) * +req.params.limit;
    const end = +start +  (+req.params.limit - 1);

    const bookings = await bookingModel.loadAll([], {})
    let entityBookings = [];
    bookings.forEach(booking => {
      entityBookings.push(booking.dataValues)
    });

    // cut end of array
    entityBookings.splice(+end + 1);
    // cut start of array
    entityBookings.splice(0, +start);
    
    res.status(200).json({
      success: true,
      bookings: entityBookings
    });
  } catch (err) {
    res.status(500).json({
      error: true,
      message: err
    });
  }
})

Router.put('/', async (req, res) => {
  try {
    if(Object.keys(req.body).length){
      const bookingId = req.body.id;
      delete req.body.id;
      const booking = bookingModel.modify(req.body, {where : {id: bookingId}});  

      res.status(200).json({
        success: true,
        booking
      })
    }
    else{
      res.status(400).json({
        error: true,
        message: "Update is not success"
      })
    }
  } catch (error) {
    res.status(500).json({
      error: true,
      message: "Lỗi gì đoán xem !!!!"
    })
  }

  
})

module.exports = Router;