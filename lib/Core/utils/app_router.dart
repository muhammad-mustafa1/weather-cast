import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_cast/Core/utils/api_service.dart';
import 'package:weather_cast/Features/home/data/repos/home_repo_impl.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/home_view.dart';
import 'package:weather_cast/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const homeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => BlocProvider(
          create: (context) => WeatherCubit(
              homeRepo: HomeRepoImpl(apiService: ApiService(dio: Dio())))
            ..getWeather(cityName: 'cairo'),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
