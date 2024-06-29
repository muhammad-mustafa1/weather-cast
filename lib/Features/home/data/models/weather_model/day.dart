import 'condition.dart';

class Day {
  double? avgtempC;
  int? avghumidity;
  Condition? condition;

  Day({this.avgtempC, this.avghumidity, this.condition});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        avgtempC: (json['avgtemp_c'] as num?)?.toDouble(),
        avghumidity: json['avghumidity'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'avgtemp_c': avgtempC,
        'avghumidity': avghumidity,
        'condition': condition?.toJson(),
      };
}
