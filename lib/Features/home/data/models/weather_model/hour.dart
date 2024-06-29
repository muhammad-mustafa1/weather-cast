import 'condition.dart';

class Hour {
  String? time;
  double? tempC;
  int? isDay;
  Condition? condition;
  double? windKph;
  int? humidity;

  Hour({
    this.time,
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.humidity,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        time: json['time'] as String?,
        tempC: json['temp_c'] as double?,
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        humidity: json['humidity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'temp_c': tempC,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'humidity': humidity,
      };
}
