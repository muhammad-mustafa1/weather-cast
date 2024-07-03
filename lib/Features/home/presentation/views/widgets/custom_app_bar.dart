import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/Core/utils/api_service.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo_impl.dart';
import 'package:weather_cast/Features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/city_search_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.cityName,
  });
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.white,
        ),
        const SizedBox(width: 23),
        Text(
          cityName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showSearch(
              context: context,
              delegate: CitySearchDelegate(
                SearchCubit(
                  homeRepo: HomeRepoImpl(
                    apiService: ApiService(dio: Dio()),
                  ),
                ),
              ),
            ).then(
              (value) {
                if (value != null) {
                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: value.name!);
                }
              },
            );
          },
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
    );
  }
}
