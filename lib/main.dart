import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_cast/Core/utils/app_router.dart';

void main() {
  runApp(const WeatherCast());
}

class WeatherCast extends StatelessWidget {
  const WeatherCast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      title: 'WeatherCast',
      theme: ThemeData(
        fontFamily: GoogleFonts.overpass().fontFamily,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
