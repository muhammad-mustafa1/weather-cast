import 'package:flutter/material.dart';

class WeatherDetailsItem extends StatelessWidget {
  const WeatherDetailsItem({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });
  final String icon;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(width: 20),
        Container(
          color: Colors.white,
          width: 1,
          height: 21,
        ),
        const SizedBox(width: 20),
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ],
    );
  }
}
