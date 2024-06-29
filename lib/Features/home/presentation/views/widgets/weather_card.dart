import 'package:flutter/material.dart';
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
    return Card(
      color: Colors.white.withOpacity(.3),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Today, 12 Septamber',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            '${weatherModel.current!.tempC!.ceil()}°C',
            style: const TextStyle(
              fontSize: 100,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            weatherModel.current!.condition!.text!,
            style: const TextStyle(
              height: 1,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
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
                  value: '${weatherModel.current!.humidity} %',
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
