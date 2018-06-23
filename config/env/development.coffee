'use strict'


if process && process.env && process.env.MIGRATE == 'drop'
  migrate = 'drop'
else
  migrate = 'safe'

config =
  # server config
  app_port: 3002
  # waterline config
  waterline:
    datastores:
      default:
        adapter: 'sails-postgres'
        url: 'postgres://expresstest@localhost:5432/expresstest_development'
    migrate: migrate

module.exports = config