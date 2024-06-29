import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/forecast.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/hour.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_cast/Features/home/presentation/manager/weather_cubit.dart';
import 'package:weather_cast/Features/home/presentation/views/widgets/weather_card.dart';
import 'package:weather_cast/Features/splash/presentation/views/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, right: 30, left: 30),
      child: SingleChildScrollView(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              return Column(
                children: [
                  CustomAppBar(
                    cityName: state.weatherModel.location!.name!,
                  ),
                  const SizedBox(height: 24),
                  Image.network(
                    'http:${state.weatherModel.current!.condition!.icon!}',
                    width: 128,
                    height: 128,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 24),
                  WeatherCard(
                    weatherModel: state.weatherModel,
                  ),
                  ForecastWeatherlist(
                    weatherModel: state.weatherModel,
                  )
                ],
              );
            } else if (state is WeatherFailure) {
              return Column(
                children: [
                  Center(child: Text(state.errorMessage)),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class ForecastWeatherlist extends StatelessWidget {
  const ForecastWeatherlist({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: weatherModel.forecast!.forecastday![0].hour!.length,
        itemBuilder: (context, index) => ForecastWeatherItem(
            hourModel: weatherModel.forecast!.forecastday![0].hour![index]),
      ),
    );
  }
}

class ForecastWeatherItem extends StatelessWidget {
  const ForecastWeatherItem({super.key, required this.hourModel});
  final Hour hourModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${hourModel.tempC!.ceil()}°',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Image.network(
          'https:${hourModel.condition!.icon}',
        ),
        const Text(
          '17:00',
          //TODO: add time
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}
