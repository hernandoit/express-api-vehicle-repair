const mongoose = require('mongoose')

const Schema = mongoose.Schema

const ticketSchema = require('./ticket')

const carSchema = new Schema({
  year: {
    type: Number,
    required: true
  },
  make: {
    type: String,
    required: true
  },
  model: {
    type: Number,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  tickets: [ticketSchema]
}, 
{
  timestamps: true
})

module.exports = mongoose.model('car', carSchema)
