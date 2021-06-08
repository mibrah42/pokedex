import 'package:flutter/material.dart';
import 'package:pokedex/screens/landing_screen.dart';

void main() {
  runApp(
    Pokedex(),
  );
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
