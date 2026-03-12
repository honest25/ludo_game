import 'package:flutter/material.dart';
import 'ui/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LudoApp());
}

class LudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo King Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
