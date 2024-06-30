import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:weather_cast/Core/functions/format_date_time.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/forecast_weather_item.dart';

class ForecastWeatherlist extends StatefulWidget {
  const ForecastWeatherlist({super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  State<ForecastWeatherlist> createState() => _ForecastWeatherlistState();
}

class _ForecastWeatherlistState extends State<ForecastWeatherlist> {
  int currentIndex = 0;
  @override
  void initState() {
    changeForecastInitialIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ScrollablePositionedList.builder(
        initialScrollIndex: currentIndex,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.weatherModel.forecast!.forecastday![0].hour!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: currentIndex == index
                  ? const Border.fromBorderSide(
                      BorderSide(width: 1, color: Colors.white38))
                  : null,
              color: currentIndex == index ? const Color(0xff6BBDEB) : null,
              //  currentIndex == index ? const Color(0xff6BBDEB) : null,
            ),
            margin: EdgeInsets.symmetric(horizontal: index != 0 ? 6 : 12),
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ForecastWeatherItem(
                  hourModel: widget
                      .weatherModel.forecast!.forecastday![0].hour![index]),
            ),
          );
        },
      ),
    );
  }

  void changeForecastInitialIndex() {
    for (var element in widget.weatherModel.forecast!.forecastday![0].hour!) {
      var forecastTime = formateDateTime(element.time!);
      var currentTime =
          formateDateTime(widget.weatherModel.current!.lastUpdated!);
      if (forecastTime.hour == currentTime.hour) {
        currentIndex = forecastTime.hour;
      }
    }
  }
}
