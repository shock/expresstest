express = require('express')
router = express.Router()
Waterline = require('waterline')

extend = require('extend')
processGetRequest = (req, res, cb) ->
  # merge the query parameters in the req.params
  req.params = extend(req.params, req.query)

### GET index ###

router.get '/', (req, res, next) ->
  Waterline.getModel('user', req.orm).find().exec (err, result_set) ->
    if err
      switch err.name
        when 'UsageError'
          return res.sendStatus(400)
        else
          console.error 'Unexpected error occurred:', err.stack
          return res.sendStatus(500)
    res.json result_set
  return

### GET show ###

router.get '/:id', (req, res, next) ->
  processGetRequest(req, res)
  console.log req.params
  Waterline.getModel('user', req.orm)
  .findOne(id: req.params.id)
  .exec (err, result_set) ->
    if err
      switch err.name
        when 'UsageError'
          return res.sendStatus(400)
        else
          console.error 'Unexpected error occurred:', err.stack
          return res.sendStatus(500)
    res.json result_set
  return


module.exports = router
