const { Server } = require("socket.io");
const roomManager = require("./roomManager");

module.exports = (server) => {

    const io = new Server(server, {
        cors: {
            origin: "*"
        }
    });

    io.on("connection", (socket) => {

        console.log("User connected:", socket.id);

        socket.on("create_room", () => {

            const room = roomManager.createRoom(socket.id);

            socket.join(room);

            socket.emit("room_created", room);
        });

        socket.on("join_room", (roomId) => {

            socket.join(roomId);

            roomManager.addPlayer(roomId, socket.id);

            io.to(roomId).emit("player_joined");
        });

        socket.on("roll_dice", () => {

            const dice = Math.floor(Math.random()*6)+1;

            socket.emit("dice_result", dice);

        });

        socket.on("move_token", (data) => {

            io.to(data.room).emit("token_moved", data);

        });

        socket.on("disconnect", () => {
            console.log("User disconnected");
        });

    });

};
