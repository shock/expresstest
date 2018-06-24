express = require('express')
router = express.Router()
Waterline = require('waterline')
extend = require('extend')
ru = rootRequire('app/lib/request_utils')

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
    if ru.hasError(err, res)
      return
    res.json result_set
  return

### GET show ###

router.get '/:id', (req, res, next) ->
  ru.merge_params(req)
  req.models.user
  .findOne(id: req.params.id)
  .exec (err, result_set) ->
    return if ru.hasError(err, res, next)
    res.json result_set
  return


module.exports = router
