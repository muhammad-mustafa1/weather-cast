import 'package:weather_cast/Features/home/data/models/forcast_model.dart';

class WeatherModel {
  final String cityName;
  final String image;
  final String date;
  final num temp;
  final String condition;
  final num wind;
  final num hum;
  final List<ForecastModel> forecastList;

  WeatherModel(
      {required this.cityName,
      required this.image,
      required this.date,
      required this.temp,
      required this.condition,
      required this.wind,
      required this.hum,
      required this.forecastList});

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
        cityName: jsonData['location']['name'],
        image: jsonData['current']['condition']['icon'],
        date: jsonData['location']['localtime'],
        temp: jsonData['current']['temp_c'],
        condition: jsonData['current']['condition']['text'],
        wind: jsonData['current']['wind_kph'],
        hum: jsonData['current']['humidity'],
        forecastList: jsonData['forecast']['forecastday']);
  }
}
