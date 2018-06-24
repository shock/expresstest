### Various utilities for request handling ###

extend = require 'extend'

module.exports =

  #  =============
  #  = Utilities =
  #  =============

  # Merge query (GET) and body (POST/PUT) params into request params
  merge_params: (req) ->
    if req.method == 'GET'
      extend(req.params, req.query)
    else if req.method == 'POST' || req.method == 'POST'
      null

  # if err is undefined, returns true
  # otherwise, sets up the response and returns false
  hasError: (err, res) ->
    if err
      console.log("Error `#{err.name}`")
      switch err.name
        when 'UsageError'
          res.sendStatus(400)
          return true
        when 'AdapterError'
        else
          console.error 'Unexpected error occurred'
          res.sendStatus(500)
          return true
      console.log err.stack
    return false