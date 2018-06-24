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
  # server config
  app_port: 3000
  # Waterline config
  waterline:
    adapters: 'sails-postgres': require('sails-postgresql')
    datastores:
      default:
        adapter: 'sails-postgres'
        url: 'postgres://expresstest@localhost:5432/expresstest_development'
    migrate: 'safe'
    defaultModelSettings:
      primaryKey: 'id'
      datastore: 'default'
      attributes:
        id:
          type: 'number'
          autoMigrations:
            autoIncrement: true
            columnType: '_numberkey'
            unique: true
        created_at:
          type: 'number'
          autoMigrations: columnType: '_numbertimestamp'
          autoCreatedAt: true
        updated_at:
          type: 'number'
          autoMigrations: columnType: '_numbertimestamp'
          autoUpdatedAt: true


# Override the default config with values from the environment config
config = extend(true, default_config, config)

module.exports = config