import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_details_item.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.3),
      child: const Column(
        children: [
          SizedBox(height: 17),
          Text(
            'Today, 12 Septamber',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            '29°',
            style: TextStyle(
              fontSize: 100,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            'Cloudy',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 34),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 67),
            child: Column(
              children: [
                WeatherDetailsItem(
                  icon: 'assets/icons/windy.png',
                  text: 'Wind',
                  value: '10 km/h',
                ),
                SizedBox(height: 21),
                WeatherDetailsItem(
                  icon: 'assets/icons/hum.png',
                  text: 'Hum ',
                  value: '26 %',
                ),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
