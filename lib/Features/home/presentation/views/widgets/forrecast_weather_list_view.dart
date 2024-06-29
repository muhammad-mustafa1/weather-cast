import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/forecast_weather_item.dart';

class ForecastWeatherlist extends StatelessWidget {
  const ForecastWeatherlist({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: weatherModel.forecast!.forecastday![0].hour!.length,
        itemBuilder: (context, index) => ForecastWeatherItem(
            hourModel: weatherModel.forecast!.forecastday![0].hour![index]),
      ),
    );
  }
}
