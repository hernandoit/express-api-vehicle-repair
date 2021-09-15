const mongoose = require('mongoose')

const User = require('./user')

// Create schema contstructor
const Schema = mongoose.Schema

const ticketSchema = new Schema(
  {
    job: {
        type: String,
        required: true,
    },
    labor: {
        type: Number,
        required: true,
    },
    isComplete: {
        type: Boolean,
        required: true,
        default: false,
    },
    owner: { 
        type: Schema.Types.ObjectId, 
        ref: 'User' 
    }
  },
  {
    timestamps: true
  }
)

module.exports = ticketSchema
