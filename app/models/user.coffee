'use strict'

Waterline = require('waterline')
config = rootRequire('config/config').waterline
extend = require 'extend'

User = extend true, {}, config.defaultModelSettings,
  identity: 'user'
  tableName: 'users'
  attributes:
    first_name:
      type: 'string'
      autoMigrations:
        columnType: '_stringkey'
    last_name:
      type: 'string'
      autoMigrations:
        columnType: '_stringkey'

module.exports = Waterline.Collection.extend User


