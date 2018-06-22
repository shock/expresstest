var express = require('express');
var router = express.Router();
var Waterline = require('waterline');

/* GET users listing. */
router.get('/', function(req, res, next) {
  Waterline.getModel('user', orm)
  .findOne({ id: req.params.id }, function(err, record) {
    if(err && err.name === 'UsageError') {
      return res.sendStatus(400);
    }
    else if (err && err.name === 'AdapterError' && err.code === 'E_UNIQUE') {
      return res.status(401).json(err);
    }
    else if (err) {
      console.error('Unexpected error occurred:',err.stack);
      return res.sendStatus(500);
    }
    else {
      return res.json(record);
    }
  });

});

module.exports = router;
