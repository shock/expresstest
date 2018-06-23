var express = require('express');
var router = express.Router();
var User = require('../lib/user');
var Waterline = require('waterline');

/* GET users listing. */
router.get('/', function(req, res, next) {
  Waterline.getModel('user', req.orm)
  .find().exec(function(err, records) {
    if(err) {
      switch (err.name) {
        case 'UsageError':
          return res.sendStatus(400);
        default:
          console.error('Unexpected error occurred:',err.stack);
          return res.sendStatus(500);
      }
    }//-•

    return res.json(records);
  });
});

module.exports = router;
