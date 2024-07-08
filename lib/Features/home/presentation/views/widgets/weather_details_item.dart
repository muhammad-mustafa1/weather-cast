import 'package:flutter/material.dart';
import 'package:weather_cast/Core/utils/styles.dart';

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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 20),
        Text(
          text,
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 20),
        Container(
          color: Colors.white,
          width: 1,
          height: 18,
        ),
        const SizedBox(width: 20),
        Text(
          value,
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
