'use strict'
Waterline = require('waterline')
config = require('./config')
waterline = new Waterline
# Load models into waterline collection
User = rootRequire('app/models/user')
waterline.registerModel User

module.exports.initialize = (app, PORT, callback) ->
  # Initialize the whole database and store models and connections to app
  waterline.initialize config, (err, models) ->
    if err
      console.log 'error initializing waterline: ' + err
      throw err
    console.log 'waterline initialized'
    app.models = models.collections
    callback models.collections, models.connections
    return
  return
