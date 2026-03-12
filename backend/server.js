const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const cors = require('cors');

const app = express();
app.use(cors());
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: "*" } });

const rooms = {};

io.on('connection', (socket) => {
    console.log('Player connected:', socket.id);

    // Create Room
    socket.on('createRoom', () => {
        const roomCode = Math.random().toString(36).substring(2, 8).toUpperCase();
        rooms[roomCode] = { players: [socket.id], gameState: null };
        socket.join(roomCode);
        socket.emit('roomCreated', roomCode);
    });

    // Join Room
    socket.on('joinRoom', (roomCode) => {
        if (rooms[roomCode] && rooms[roomCode].players.length < 4) {
            rooms[roomCode].players.push(socket.id);
            socket.join(roomCode);
            io.to(roomCode).emit('playerJoined', rooms[roomCode].players);
        } else {
            socket.emit('error', 'Room full or does not exist');
        }
    });

    // Handle Dice Roll & Moves
    socket.on('makeMove', (data) => {
        const { roomCode, player, tokenIndex, diceValue } = data;
        // Broadcast move to all other players in the room
        socket.to(roomCode).emit('updateBoard', data);
    });

    socket.on('disconnect', () => {
        console.log('Player disconnected:', socket.id);
        // Implement logic to handle player drops/reconnects here
    });
});

server.listen(3000, () => {
    console.log('Ludo Multiplayer Server running on port 3000');
});
