import 'package:bloc/bloc.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.homeRepo}) : super(WeatherInitial());
  final HomeRepo homeRepo;
  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoading());

    var result = await homeRepo.fetchWeather(cityName: cityName);

    result.fold((failure) {
      emit(WeatherFailure(errorMessage: failure.errorMessage));
    }, (weather) {
      emit(WeatherSuccess(weatherModel: weather));
    });
  }
}
