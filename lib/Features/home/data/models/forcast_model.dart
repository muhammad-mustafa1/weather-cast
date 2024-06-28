class ForecastModel {
  final num temp;
  final String image;
  final String date;

  ForecastModel({
    required this.image,
    required this.date,
    required this.temp,
  });

  factory ForecastModel.fromJson(jsonData) {
    return ForecastModel(
        image: jsonData['day']['condition']['icon'],
        date: jsonData['date'],
        temp: jsonData['day']['avgtemp_c']);
  }
}
