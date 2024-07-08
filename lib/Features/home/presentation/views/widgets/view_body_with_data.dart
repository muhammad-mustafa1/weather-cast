import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/current_weather_section.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/forrecast_weather_list_view.dart';

class HomeViewBodyWithData extends StatelessWidget {
  const HomeViewBodyWithData({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CurrentWeatherSection(weatherModel: weatherModel),
        ),
        const SizedBox(height: 20),
        ForecastWeatherlist(
          weatherModel: weatherModel,
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
