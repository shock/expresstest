'use strict'

Waterline = require('waterline')
config = rootRequire('config/config').waterline
extend = require 'extend'

module.exports = Waterline.Collection.extend(extend true, {}, config.defaultModelSettings,
  identity: 'user'
  attributes:
    firstName: type: 'string'
    lastName: type: 'string'
)


