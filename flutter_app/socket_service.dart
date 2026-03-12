socket = IO.io(
  "https://ludo-multiplayer-server.onrender.com",
  IO.OptionBuilder()
      .setTransports(['websocket'])
      .build(),
);
