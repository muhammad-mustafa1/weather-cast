import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherCast());
}

class WeatherCast extends StatelessWidget {
  const WeatherCast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherCast',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
