import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_cast/Core/widgets/custom_error_widget.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/view_body_with_data.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/view_body_without_data.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool? hasData;
  @override
  void initState() {
    super.initState();
    checkHasData();
  }

  Future<void> checkHasData() async {
    final prefs = await SharedPreferences.getInstance();
    hasData = prefs.getString('city')?.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return hasData == false
        ? const ViewBodyWithoutData()
        : BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherSuccess) {
                return HomeViewBodyWithData(
                  weatherModel: state.weatherModel,
                );
              } else if (state is WeatherFailure) {
                return CustomErrorWidget(errorMessage: state.errorMessage);
              } else {
                return Center(
                  child: Lottie.asset('assets/animation/home_animation.json'),
                );
              }
            },
          );
  }
}
