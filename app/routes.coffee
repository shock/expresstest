indexRouter = rootRequire('app/routes/index')
usersRouter = rootRequire('app/routes/users')

module.exports = (app) ->
  app.use '/', indexRouter
  app.use '/users', usersRouter
