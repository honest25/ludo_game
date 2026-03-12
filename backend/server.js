const express = require("express");
const http = require("http");
const cors = require("cors");

const socketHandler = require("./socket");

const app = express();
app.use(cors());

const server = http.createServer(app);

socketHandler(server);

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
    console.log("Server running on port", PORT);
});
