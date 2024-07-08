import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.homeRepo}) : super(WeatherInitial());
  final HomeRepo homeRepo;
  Future<void> fetchWeather({@required String? cityName}) async {
    final prefs = await SharedPreferences.getInstance();
    final savedCity = prefs.getString('city');
    emit(WeatherLoading());
    final result =
        await homeRepo.fetchWeather(cityName: cityName ?? savedCity!);
    result.fold(
      (failure) => emit(WeatherFailure(errorMessage: failure.errorMessage)),
      (weather) async {
        emit(WeatherSuccess(weatherModel: weather));
      },
    );
  }
}
