import 'package:flutter/material.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/splash_view_boody.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
