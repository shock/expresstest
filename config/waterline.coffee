'use strict'
Waterline = require('waterline')
config = require('./config').waterline
waterline = new Waterline

# Load models into waterline collection
User = rootRequire('app/models/user')
waterline.registerModel User

module.exports.initialize = (app, PORT, callback) ->
  # Initialize the whole database and store models and datastores to app
  waterline.initialize config, (err, models) ->
    if err
      console.log 'error initializing waterline: ' + err
      throw err
    console.log 'Waterline initialized'
    console.log models
    callback models.collections, models.datastores
    return
  return
