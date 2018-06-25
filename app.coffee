'use strict'

createError = require('http-errors')
express = require('express')
path = require('path')
cookieParser = require('cookie-parser')
logger = require('morgan')
request_utils = rootRequire('app/lib/request_utils')
methodOverride = require('method-override')

app = express()

app.use (req, res, next) ->
  req.models = app.get('models')
  next()
  return

# view engine setup
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'pug'
app.use logger('dev')
app.use express.json()
app.use express.urlencoded(extended: false)
app.use cookieParser()
app.use express.static(path.join(__dirname, 'public'))

app.use methodOverride (req, res) ->
  if req.body and typeof req.body == 'object' and '_method' of req.body
    # look in urlencoded POST bodies and delete it
    method = req.body._method
    delete req.body._method
    return method
  return

rootRequire('app/routes')(app)

# catch 404 and forward to error handler
app.use (req, res, next) ->
  next createError(404)
  return

# error handler
app.use (err, req, res, next) ->
  # set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = if req.app.get('env') == 'development' then err else {}
  # render the error page
  res.status err.status or 500
  res.render 'error'
  return

module.exports = app

