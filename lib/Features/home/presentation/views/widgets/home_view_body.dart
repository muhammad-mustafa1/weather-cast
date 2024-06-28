import 'package:flutter/material.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 48),
      child: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(height: 72),
          Image.asset(
            'assets/images/logo.png',
            width: 160,
            height: 160,
          ),
        ],
      ),
    );
  }
}
