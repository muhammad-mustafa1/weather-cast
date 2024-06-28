import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_cast/Core/errors/failures.dart';
import 'package:weather_cast/Core/utils/api_service.dart';
import 'package:weather_cast/Features/home/data/models/weather_model.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  String apiKey = '0a9cfdbf27834268a87221037242606';
  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, WeatherModel>> fetchCurrentWeather(
      {required String cityName}) async {
    try {
      var data = await apiService.get(
          endPoint: 'current.json?key=$apiKey &q=$cityName&aqi=no');
      print(data);

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
  Future<Either<Exception, WeatherModel>> fetchForecastWeather(
      {required String cityName}) {
    // TODO: implement fetchForecastWeather
    throw UnimplementedError();
  }
}
