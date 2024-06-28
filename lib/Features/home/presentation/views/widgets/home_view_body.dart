import 'package:flutter/material.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 48),
          child: CustomAppBar(),
        )
      ],
    );
  }
}
