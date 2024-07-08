import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_cast/Core/widgets/custom_error_widget.dart';
import 'package:weather_cast/Features/home/data/models/weather_model/location.dart';
import 'package:weather_cast/Features/home/presentation/manager/search_cubit/search_cubit.dart';

class CitySearchDelegate extends SearchDelegate<Location> {
  final SearchCubit seachCubit;
  final List<Location> cities = [];
  CitySearchDelegate(this.seachCubit);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final state = seachCubit.state;
    if (state is SearchSuccess) {
      return ListView.builder(
        itemCount: state.locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(state.locations[index].name!),
            subtitle: Text(state.locations[index].country!),
            leading: const Icon(Icons.location_on),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              close(context, state.locations[index]);
            },
          );
        },
      );
    } else if (state is SearchFailure) {
      return CustomErrorWidget(errorMessage: state.errorMessage);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: seachCubit.getCities(cityName: query),
        builder: (context, snapshot) {
          final state = seachCubit.state;
          if (state is SearchSuccess) {
            return ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.locations[index].name!),
                  subtitle: Text(removeIsraelFromLocation(
                      state.locations[index].country!)),
                  leading: const Icon(Icons.location_on),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    close(context, state.locations[index]);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(
                        'city', '${state.locations[index].name}');
                  },
                );
              },
            );
          } else if (state is SearchFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else {
            return Container();
          }
        });
  }
}

String removeIsraelFromLocation(String country) {
  if (country.contains('Israel')) {
    return 'palastine';
  } else if (country.contains('إسرائيل') || country == 'سرائيل') {
    return 'فلسطين';
  } else {
    return country;
  }
}