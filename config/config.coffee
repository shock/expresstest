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
  port: 3000

# Override the default config with values from the environment config
config = extend(default_config, config)

module.exports = config