import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_cast/Core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      return GoRouter.of(context).push(AppRouter.homeView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/splash.png'));
  }
}
