'use strict'
# var adapter = require('../../lib/sqladapter/postgres');
adapter = require('sails-postgresql')
config =
  app_port: 3002
  adapters:
    default: adapter
    postgres: require('sails-postgresql')
  datastores: postgres_database:
    migrate: 'safe'
    adapter: 'postgres'
    host: 'localhost'
    user: 'expresstest'
    database: 'expresstest_development'
    port: 5432
  defaults: migrate: 'safe'
  hooks:
    grunt: false
    sockets: false
    pubsub: false
  globals: false

module.exports = config