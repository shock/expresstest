express = require('express')
router = express.Router()
Waterline = require('waterline')
extend = require('extend')

# wl_init_promise = new Promise((resolve, reject) ->
#   waterline.initialize config, (err, orm) ->
#     if err
#       console.log 'error initializing waterline: ' + err
#       reject err
#     resolve(orm)
#     return
#   return
# )

### GET index ###

router.get '/', (req, res, next) ->
  req.models.user.find().exec (err, result_set) ->
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
  console.log req.params
  req.models.user
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
