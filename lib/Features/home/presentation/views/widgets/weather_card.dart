import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_cast/Core/utils/styles.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_details_item.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white54),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            DateFormat.MMMMEEEEd()
                .format(DateTime.parse(weatherModel.current!.lastUpdated!)),
            style: Styles.textStyle18,
          ),
          Text(
            '${weatherModel.current!.tempC!.ceil()}°',
            style: Styles.textStyle60.copyWith(
              shadows: const [
                Shadow(
                  color: Colors.black12,
                  blurRadius: 1.0,
                  offset: Offset(-2.0, 2.0),
                ),
                Shadow(
                  color: Colors.black26,
                  offset: Offset(-18, 0),
                  blurRadius: 60,
                ),
                Shadow(
                  color: Colors.grey,
                  blurRadius: 1.0,
                  offset: Offset(-2.0, 2.0),
                ),
              ],
            ),
          ),
          Text(
            weatherModel.current!.condition!.text!,
            style: Styles.textStyle24,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherDetailsItem(
                  icon: 'assets/icons/windy.png',
                  text: 'Wind',
                  value: '${weatherModel.current!.windKph} km/h',
                ),
                const SizedBox(height: 20),
                WeatherDetailsItem(
                  icon: 'assets/icons/hum.png',
                  text: 'Hum ',
                  value: '${weatherModel.current!.humidity}%',
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
