const express = require("express");
const http = require("http");
const socketio = require("socket.io");
const cors = require("cors");

const app = express();

app.use(cors());

const server = http.createServer(app);

const io = socketio(server, {
  cors: {
    origin: "*",
    methods: ["GET","POST"]
  }
});

let rooms = {};

app.get("/", (req,res)=>{
  res.send("Ludo Multiplayer Server Running");
});

io.on("connection", socket => {

  console.log("Player connected:", socket.id);

  socket.on("createRoom", () => {

    let roomCode = Math.random().toString(36).substring(7);

    rooms[roomCode] = [];

    rooms[roomCode].push(socket.id);

    socket.join(roomCode);

    socket.emit("roomCreated", roomCode);

  });

  socket.on("joinRoom", (code) => {

    if(rooms[code]){

      rooms[code].push(socket.id);

      socket.join(code);

      io.to(code).emit("playerJoined");

    }

  });

  socket.on("disconnect", () => {
    console.log("Player disconnected");
  });

});

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
