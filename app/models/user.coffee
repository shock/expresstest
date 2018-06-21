'use strict'
Waterline = require('waterline')
config = rootRequire('config/config')
module.exports = Waterline.Collection.extend
  connection: 'postgres_database'
  schema: true
  identity: 'user'
  primaryKey: 'id'
  attributes:
    id:
      columnName: 'id'
      type: 'number'
    createdAt:
      type: 'number'
      autoCreatedAt: true
    updatedAt:
      type: 'number'
      autoUpdatedAt: true
