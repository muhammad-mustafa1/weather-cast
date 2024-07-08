import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        CachedNetworkImage(
          imageUrl: 'https:${hourModel.condition!.icon}',
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Text(
          DateFormat.j().format(DateTime.parse(hourModel.time!)),
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
