### Various utilities for request handling ###

extend = require 'extend'

module.exports =

  #  =============
  #  = Utilities =
  #  =============

  # Merge GET request and query params into req.params
  merge_params: (req) ->
    if req.method == 'GET'
      extend(req.params, req.query)

  # if err is undefined, returns true
  # otherwise, sets up the response and returns false
  handleError: (err) ->
    # if err
    #   console.log("Error `#{err.name}`")
    #   switch err.name
    #     when 'UsageError'
    #       res.sendStatus(400)
    #       return true
    #     when 'AdapterError'
    #     else
    #       console.error 'Unexpected error occurred'
    #       res.sendStatus(500)
    #       return true
    #   console.log err.stack
    # return false
    throw err