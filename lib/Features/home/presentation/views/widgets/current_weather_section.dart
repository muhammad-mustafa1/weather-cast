import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_card.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          cityName: weatherModel.location!.name!,
        ),
        CachedNetworkImage(
          imageUrl: 'http:${weatherModel.current!.condition!.icon!}',
          width: 128,
          height: 128,
          fit: BoxFit.cover,
        ),
        WeatherCard(
          weatherModel: weatherModel,
        ),
      ],
    );
  }
}
