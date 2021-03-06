express = require('express')
router = express.Router()
Waterline = require('waterline')
extend = require('extend')
r_utils = rootRequire('app/lib/request_utils')

### GET index ###

router.get '/', (req, res, next) ->
  r_utils.merge_params(req)
  req.models.user.find().exec (err, result_set) ->
    throw err if err
    res.locals.users = result_set
    res.render 'users/index'
  return

### GET new ###

router.get '/new', (req, res, next) ->
  res.locals.user = {}
  res.render 'users/new'
  return

### POST create ###

router.post '/', (req, res, next) ->
  req.models.user.create(req.body)
  .meta(fetch: true)
  .exec (err, result_set) ->
    throw err if err
    res.locals.user = result_set
    res.render 'users/show'
  return

### POST destoy ###

router.get '/:id/delete', (req, res, next) ->
  req.models.user.destroy { id: req.params.id }, (err) ->
    throw err if err
    res.redirect("/users")
  return

### GET show ###

router.get '/:id', (req, res, next) ->
  r_utils.merge_params(req)
  req.models.user
  .findOne(id: req.params.id)
  .exec (err, result_set) ->
    throw err if err
    res.locals.user = result_set
    res.render 'users/show'
  return

### GET edit ###

router.get '/:id/edit', (req, res, next) ->
  r_utils.merge_params(req)
  req.models.user
  .findOne(id: req.params.id)
  .exec (err, result_set) ->
    throw err if err
    res.locals.user = result_set
    res.render 'users/edit'
  return

### PUT update ###

router.put '/:id', (req, res, next) ->
  # r_utils.merge_params(req)
  console.log req.body
  values_to_set = extend({}, req.body)
  delete values_to_set.id
  console.log values_to_set
  req.models.user
  .update(id: req.params.id)
  .set(values_to_set)
  .meta(fetch: true)
  .exec (err, result_set) ->
    throw err if err
    if result_set.length < 1
      res.sendStatus 404
    else
      res.redirect("/users/#{req.params.id}")
  return

module.exports = router
