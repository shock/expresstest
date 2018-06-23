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
    waterline.initialize config, (err, orm) ->
      if err
        console.log 'error initializing waterline: ' + err
        reject err
      resolve(orm)
      return
    return
  )
  wl_init_promise.then (orm) ->
    console.log 'Waterline initialized'
    console.log "Running auto migrations with strategy '#{config.migrate}'"

    # a total hack to get the migration strategy to work!
    waterline.collections = orm.collections
    waterline.datastores = orm.datastores
    # end of hack

    runAutoMigrations config.migrate, waterline, (err) ->
      if err
        throw err
    callback orm

  .catch (err) ->
    throw err




module.exports.initialize = initialize
