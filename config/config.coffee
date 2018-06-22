'use strict'

moment = require 'moment-timezone'
extend = require 'extend'

config = null
moment = require('moment-timezone')
if process and process.env and process.env.NODE_ENV
  console.log 'NODE_ENV found: ' + process.env.NODE_ENV + ' ' + moment(new Date).format('MM/DD/YYYY: hh:mmA')
  config = require('./env/' + process.env.NODE_ENV)
else
  config = require('./env/development')
  console.log 'NODE_ENV found: ' + 'development' + ' ' + moment(new Date).format('MM/DD/YYYY: hh:mmA')

# Default config
default_config =
  app_port: 3000
  # Waterline config
  adapters: 'sails-postgres': require('sails-postgresql')
  datastores:
    default:
      adapter: 'sails-postgres'
      url: 'postgres://expresstest@localhost:5432/expresstest_development'
    postgres_database:
      adapter: 'sails-postgres'
      url: 'postgres://expresstest@localhost:5432/expresstest_development'
  # models:
  #   user: rootRequire('app/models/user')
  defaultModelSettings:
    primaryKey: 'id'
    datastore: 'default'
    attributes:
      id:
        type: 'number'
        autoMigrations: autoIncrement: true
      createdAt:
        type: 'number'
        autoCreatedAt: true
      updatedAt:
        type: 'number'
        autoUpdatedAt: true


# Override the default config with values from the environment config
config = extend(default_config, config)

module.exports = config