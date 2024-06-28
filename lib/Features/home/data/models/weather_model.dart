class WeatherModel {
  final String cityName;
  final String image;
  final String date;
  final String temp;
  final String condition;
  final String wind;
  final String hum;

  WeatherModel(
      {required this.cityName,
      required this.image,
      required this.date,
      required this.temp,
      required this.condition,
      required this.wind,
      required this.hum});

  factory WeatherModel.fromJson(jsonData) {
    return WeatherModel(
        cityName: jsonData['location']['name'],
        image: jsonData['current']['condition']['icon'],
        date: jsonData['location']['localtime'],
        temp: jsonData['current']['temp_c'],
        condition: jsonData['current']['condition']['text'],
        wind: jsonData['current']['wind_kph'],
        hum: jsonData['current']['humidity']);
  }
}
