class Weather {
  final int id;
  final String main;
  final String desc;
  final String icon;
  final double temperature;
  final String city;
  Weather(
      {required this.id,
      required this.main,
      required this.desc,
      required this.icon,
      required this.temperature,
      required this.city});
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['weather'][0]['id'],
        main: json['weather'][0]['main'],
        desc: json['weather'][0]['description'],
        icon: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        city: json['name']);
  }
}
