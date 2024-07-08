import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0582ca),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
