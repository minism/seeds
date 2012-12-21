express     = require 'express'
http        = require 'http'
path        = require 'path'
ect         = require 'ect'

routes      = require './routes'
middleware  = require './middleware'
settings    = require './settings'


# Express configuration and middleware
app = express()
app.configure ->
    # Network config
    app.set 'port', settings.PORT

    # View config
    viewpath = path.join(__dirname, '/views')
    app.set 'views',  viewpath
    app.set 'view engine', 'html'
    app.engine 'html', ect({root: viewpath}).render

    # Session
    app.use express.cookieParser()
    app.use express.session
        secret: settings.SECRET_KEY
       
    # Favicon url shortcut
    app.use express.favicon('')

    # Logging
    app.use express.logger('dev')

    # Request body parsing (JSON, ...)
    app.use express.bodyParser()

    # Allow routes with methods PUT, DELETE, etc...
    app.use express.methodOverride()

    # Coffeescript/LESS compilation and bundling
    app.use require('connect-assets')({src: 'public'})

    # Static file serving
    app.use '/public', express.static(path.join(__dirname, 'public'))

    # App-wide middleware
    app.use middleware.messages


# Dev profile
app.configure 'development', ->
    app.use(express.errorHandler())


# Register application routes
require('./routes')(app)


http.createServer(app).listen app.get('port'), ->
    console.log "Listening on port #{ app.get('port') }..."
