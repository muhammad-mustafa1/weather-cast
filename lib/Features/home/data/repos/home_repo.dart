import 'package:dartz/dartz.dart';
import 'package:weather_cast/Core/errors/failures.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> fetchCurrentWeather(
      {required String cityName});
}
