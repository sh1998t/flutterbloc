import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String desc;
  final String icon;
  final double temperature;
  final String city;

  Weather({
    required this.id,
    required this.main,
    required this.desc,
    required this.icon,
    required this.temperature,
    required this.city,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    return Weather(
      id: weather['id'],
      main: weather['main'],
      desc: weather['description'],
      icon: weather['icon'],
      temperature: (json['main']['temp'] as num).toDouble(),
      city: json['name'],
    );
  }

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
