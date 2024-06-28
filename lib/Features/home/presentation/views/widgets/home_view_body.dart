import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_card.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, right: 30, left: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(height: 24),
            Image.asset('assets/images/logo.png', width: 120, height: 120),
            const SizedBox(height: 24),
            const WeatherCard(),
          ],
        ),
      ),
    );
  }
}
