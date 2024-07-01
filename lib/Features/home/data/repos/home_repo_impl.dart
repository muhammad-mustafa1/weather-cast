import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_cast/Core/errors/failures.dart';
import 'package:weather_cast/Core/utils/api_service.dart';
import 'package:weather_cast/Features/home/data/models/location_model/location_model.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  String apiKey = '0a9cfdbf27834268a87221037242606';
  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, WeatherModel>> fetchWeather(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint: 'forecast.json?key=$apiKey &q=$cityName&aqi=no&days=7');
      return right(WeatherModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LocationModel>> fetchCities(
      {required String cityName}) async {
    try {
      var data =
          await apiService.get(endPoint: 'search.json?key=$apiKey&q=$cityName');
      return right(LocationModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
