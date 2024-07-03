import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/Core/widgets/custom_error_widget.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/current_weather_section.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/forrecast_weather_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccess) {
          return ListView(
            children: [
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CurrentWeatherSection(weatherModel: state.weatherModel),
              ),
              const SizedBox(height: 20),
              ForecastWeatherlist(
                weatherModel: state.weatherModel,
              ),
              const SizedBox(height: 20)
            ],
          );
        } else if (state is WeatherFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
