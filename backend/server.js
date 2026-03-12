const express = require("express")
const http = require("http")
const socketio = require("socket.io")

const app = express()
const server = http.createServer(app)
const io = socketio(server)

let rooms = {}

io.on("connection", socket => {

    console.log("Player connected")

    socket.on("createRoom", () => {

        let roomCode = Math.random().toString(36).substring(7)

        rooms[roomCode] = []

        rooms[roomCode].push(socket.id)

        socket.join(roomCode)

        socket.emit("roomCreated", roomCode)

    })

    socket.on("joinRoom", (code) => {

        if(rooms[code]){

            rooms[code].push(socket.id)

            socket.join(code)

            io.to(code).emit("playerJoined")

        }

    })

})

server.listen(3000, () => {
    console.log("Server running on port 3000")
})
