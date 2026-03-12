import 'package:flutter/material.dart';
import 'ui/splash_screen.dart';

void main() {
  runApp(LudoApp());
}

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Multiplayer',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
