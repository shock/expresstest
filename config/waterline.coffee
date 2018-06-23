'use strict'
Waterline = require('waterline')
config = require('./config').waterline
waterline = new Waterline
runAutoMigrations = require 'waterline-utils/lib/auto-migrations'

# Load models into waterline collection
User = rootRequire('app/models/user')
waterline.registerModel User

initialize = (app, PORT, callback) ->
  # Initialize the whole database and store models and datastores to app
  wl_init_promise = new Promise((resolve, reject) ->
    waterline.initialize config, (err, models) ->
      if err
        console.log 'error initializing waterline: ' + err
        reject err
      console.log 'Waterline initialized 1'
      resolve(models)
      return
    return
  )
  wl_init_promise.then (models) ->
    console.log "Running auto migrations with strategy '#{config.migrate}'"

    # a total hack to get the migration strategy to work!
    waterline.collections = models.collections
    waterline.datastores = models.datastores
    # end of hack

    runAutoMigrations config.migrate, waterline, (err) ->
      if err
        throw err
    callback models.collections, models.datastores
  .catch (err) ->
    throw err




module.exports.initialize = initialize
