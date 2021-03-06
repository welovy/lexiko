    express = require "express"
    routes = require "./routes"
    user = require "./routes/user"
    http = require "http"
    path = require "path"

    app = express();
        
    app.set "port", process.env.PORT or 3000;
    app.set "views", __dirname + "/views"
    app.set "view engine", "jade"
    app.use express.favicon()
    app.use express.logger("dev")
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    `app.use(express.static(path.join(__dirname, "public")))`
    app.use express.errorHandler()

    app.get "/", routes.index;
    
    server = http.createServer(app).listen app.get("port"), ->
        console.log "express server listening on port " + app.get "port"
    db = new Database()
    db.open()
    
    io = (require 'socket.io').listen(server)
    io.sockets.on "connection", (socket) ->
        socket.on 'add', (data) ->
            db.getWord(data.word)
