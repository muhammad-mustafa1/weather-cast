abstract class HomeRepo {
  Future<void> fetchCurrentWeather({required String cityName}) async {}
  Future<void> fetchForecastWeather({required String cityName}) async {}
}
