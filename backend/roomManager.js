const rooms = {};

exports.createRoom = (hostId) => {

    const roomId = Math.random().toString(36).substring(2,7);

    rooms[roomId] = {
        host: hostId,
        players: [hostId]
    };

    return roomId;
};

exports.addPlayer = (roomId, playerId) => {

    if(rooms[roomId]){

        rooms[roomId].players.push(playerId);

    }

};
