express     = require 'express'
http        = require 'http'
path        = require 'path'

middleware  = require './middleware'
settings    = require './settings'


# Filesystem paths
VIEW_PATH = path.join(__dirname, 'views')
STATIC_PATH = path.join(__dirname, 'static')


# Express global configuration
app = express()
app.configure ->
  # Network config
  app.set 'port', settings.PORT

  # View config
  app.set 'views',  VIEW_PATH
  app.set 'view engine', 'jade'
  app.set 'view options',
    # Use jade inheritance instead of express layout
    layout: false

  # Session
  app.use express.cookieParser()
  app.use express.session
    store: new express.session.MemoryStore()
    secret: settings.SECRET_KEY

  # Favicon url shortcut
  app.use express.favicon('')

  # Logging
  app.use express.logger('dev')

  # Request body parsing (JSON, ...)
  app.use express.bodyParser()

  # Allow routes with methods PUT, DELETE, etc...
  app.use express.methodOverride()

  # Static file serving
  # app.use '/static', express.static STATIC_PATH

  # Global middleware
  app.use middleware.messages


# Dev profile configuration
app.configure 'development', ->
  app.use(express.errorHandler())

  # Auto LESS compilation
  less_middleware = require('less-middleware')
  app.use less_middleware
    src: path.join(STATIC_PATH, 'css')
    prefix: '/static/css'
    dumpLineNumbers: 'comments'
    compress: false

  # Static file serving
  app.use '/static', express.static STATIC_PATH


# Register all controllers on app object
require('./controllers')(app)


# Boot HTTP server
http.createServer(app).listen app.get('port'), ->
  console.log "Listening on port #{ app.get('port') }..."
