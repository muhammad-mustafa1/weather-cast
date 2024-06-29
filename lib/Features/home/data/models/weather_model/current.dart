import 'condition.dart';

class Current {
  String? lastUpdated;
  double? tempC;
  int? isDay;
  Condition? condition;
  num? windKph;
  num? humidity;

  Current({
    this.lastUpdated,
    this.tempC,
    this.isDay,
    this.condition,
    this.windKph,
    this.humidity,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdated: json['last_updated'] as String?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windKph: json['wind_kph'],
        humidity: json['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_kph': windKph,
        'humidity': humidity,
      };
}
