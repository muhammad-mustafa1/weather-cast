import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_card.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, right: 30, left: 30),
      child: SingleChildScrollView(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherSuccess) {
              return Column(
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 24),
                  Image.asset('assets/images/logo.png',
                      width: 120, height: 120),
                  const SizedBox(height: 24),
                  const WeatherCard(),
                ],
              );
            } else {
              return const Column(
                children: [
                  Center(child: Text('Something went wrong')),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
