### Various middleware utilities for request handling ###

extend = require 'extend'

module.exports =

  # Merge query (GET) and body (POST/PUT) params into request params
  merge_params: (req, res, next) ->
    if req.method == 'GET'
      req.params = extend(req.params, req.query)
    else if req.method == 'POST' || req.method == 'POST'
      null
    next()

