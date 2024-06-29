class Condition {
  String? text;
  String? icon;

  Condition({this.text, this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
      };
}
