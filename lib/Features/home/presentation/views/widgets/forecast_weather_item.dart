import 'package:flutter/material.dart';
import 'package:weather_cast/Core/functions/format_date_time.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/hour.dart';

class ForecastWeatherItem extends StatelessWidget {
  const ForecastWeatherItem({super.key, required this.hourModel});
  final Hour hourModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${hourModel.tempC!.ceil()}°',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Image.network(
          'https:${hourModel.condition!.icon}',
        ),
        Text(
          "${formateDateTime(hourModel.time!).hour.toString()}:00",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
