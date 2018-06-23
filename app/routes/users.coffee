express = require('express')
router = express.Router()
Waterline = require('waterline')

### GET users listing. ###

router.get '/', (req, res, next) ->
  Waterline.getModel('user', req.orm).find().exec (err, records) ->
    if err
      switch err.name
        when 'UsageError'
          return res.sendStatus(400)
        else
          console.error 'Unexpected error occurred:', err.stack
          return res.sendStatus(500)
    #-•
    res.json records
  return
module.exports = router
