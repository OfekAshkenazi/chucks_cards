import 'package:flutter/material.dart';
import 'package:chucks_cards/presentation/splash/SplashScreen.dart';
void main() => {
  runApp(ChucksCardsApp())
};

class ChucksCardsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SplashScreen(),
      },
      initialRoute: '/',
    );
  }

}
