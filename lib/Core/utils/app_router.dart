import 'package:go_router/go_router.dart';
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
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
