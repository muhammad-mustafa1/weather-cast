class Location {
  int? id;
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? url;

  Location({
    this.id,
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'] as int?,
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'url': url,
      };
}
