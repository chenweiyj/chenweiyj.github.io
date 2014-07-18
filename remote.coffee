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
  .listen app
io.on 'connection', (socket) ->
  console.log 'connected: ' + socket
  socket.on 'slideUpdate', (data) ->
    io.emit 'hashChange', { hash: data }
