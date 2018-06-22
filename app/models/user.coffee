'use strict'

Waterline = require('waterline')

module.exports = Waterline.Collection.extend
  identity: 'user'
  primaryKey: 'id'
  attributes:
    id:
      type: 'number'
      autoMigrations: autoIncrement: true
    createdAt:
      type: 'number'
      autoCreatedAt: true
      autoMigrations: {} # required for sails-postgresl adapter.  why?
    updatedAt:
      type: 'number'
      autoUpdatedAt: {} # required for sails-postgresl adapter.  why?
      autoMigrations: autoIncrement: true
    emailAddress: { type: 'string', required: true }
    firstName: { type: 'string' }
    lastName: { type: 'string' }
