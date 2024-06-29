import 'day.dart';
import 'hour.dart';

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.hour});

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json['date'] as String?,
        dateEpoch: json['date_epoch'] as int?,
        day: json['day'] == null
            ? null
            : Day.fromJson(json['day'] as Map<String, dynamic>),
        hour: (json['hour'] as List<dynamic>?)
            ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'date_epoch': dateEpoch,
        'day': day?.toJson(),
        'hour': hour?.map((e) => e.toJson()).toList(),
      };
}
