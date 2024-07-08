import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_cast/Core/utils/api_service.dart';
import 'package:weather_cast/Core/utils/styles.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo_impl.dart';
import 'package:weather_cast/Features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/city_search_delegate.dart';

class ViewBodyWithoutData extends StatelessWidget {
  const ViewBodyWithoutData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              showSearch(
                      context: context,
                      delegate: CitySearchDelegate(SearchCubit(
                          homeRepo: HomeRepoImpl(
                              apiService: ApiService(dio: Dio())))))
                  .then((value) {
                BlocProvider.of<WeatherCubit>(context)
                    .fetchWeather(cityName: value!.name!);
              });
            },
            child: Lottie.asset(
              'assets/animation/search.json',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'there is no weather😔',
            style: Styles.textStyle24,
          ),
          const Text(
            'start searching now 😎',
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
