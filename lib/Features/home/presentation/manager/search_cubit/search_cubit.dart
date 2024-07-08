import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/location.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.homeRepo}) : super(SearchInitial());
  final HomeRepo homeRepo;
  Future<void> getCities({required String cityName}) async {
    emit(SearchLoading());
    var result = await homeRepo.fetchCities(cityName: cityName);
    result.fold((failure) {
      emit(SearchFailure(errorMessage: failure.errorMessage));
    }, (locations) {
      emit(SearchSuccess(locations: locations));
    });
  }
}
