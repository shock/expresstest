'use strict';

var Waterline = require('waterline');
var config = require('./config');
var waterline = new Waterline();

var User = rootRequire('app/models/user');
waterline.loadCollection(User);

module.exports.initialize = function(app, PORT, callback) {
    // Initialize the whole database and store models and connections to app
    waterline.initialize(config, function(err, models) {
        if(err){
            console.log('error initializing waterline: '+err);
            throw err;
        }
        console.log('waterline initialized');

        app.models = models.collections;
        callback(models.collections, models.connections);
    });
}

return waterline;