import 'multiplayer/socket_service.dart';
void main() {

  SocketService().connect();

  runApp(LudoApp());

}
