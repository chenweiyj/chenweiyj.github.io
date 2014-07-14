fs = require 'fs'
content = require 'node-static'
file = new content.Server

app = require 'http'
  .createServer (request, response) ->
    request.addListener 'end', ->
      file.serve request, response
    .resume()
  .listen 8000

io = require 'socket.io' 
  .listen 8080
io.sockets.on 'connection', (socket) ->
  socket.on 'slideUpdate', (data) ->
    socket.broadcast.emit 'hashChange', { hash: data }
