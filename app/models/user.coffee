'use strict'

Waterline = require('waterline')
config = rootRequire('config/config').waterline
extend = require 'extend'

User = extend true, {}, config.defaultModelSettings,
  identity: 'user'
  attributes:
    firstName:
      type: 'string'
      autoMigrations:
        columnType: '_stringkey'
    lastName:
      type: 'string'
      autoMigrations:
        columnType: '_stringkey'

module.exports = Waterline.Collection.extend User


