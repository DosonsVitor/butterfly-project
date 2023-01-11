class Libary {
  final String name;
  final double lat;
  final double lng;
  Libary({required this.name, required this.lat, required this.lng});

  factory Libary.fromJson(json) {
    return Libary(
        name: json['name'],
        lat: json['geometry']['location']['lat'],
        lng: json['geometry']['location']['lng']);
  }
}
