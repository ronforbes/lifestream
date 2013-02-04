express = require 'express'
routes = require './routes'
http = require 'http'
path = require 'path'
socketio = require 'socket.io'
mongodb = require 'mongodb'

app = express();
app.configure () ->
  app.set 'port', process.env.PORT || 3000
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static path.join __dirname, 'public'
app.configure 'development', () ->
  app.use express.errorHandler()
app.get '/', routes.index

httpServer = http.createServer(app)
httpServer.listen app.get('port'), () ->
  console.log "Express server listening on port " + app.get 'port'

io = socketio.listen(httpServer)

mongoClient = mongodb.MongoClient;
mongoClient.connect "mongodb://localhost:27017/", (error, database) ->
  if !error then console.log "Connected to MongoDB"