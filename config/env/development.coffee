'use strict'

config =
  # server config
  app_port: 3002
  # waterline config
  waterline:
    datastores:
      default:
        adapter: 'sails-postgres'
        url: 'postgres://expresstest@localhost:5432/expresstest_development'
    migrationStrategy: 'drop'

module.exports = config