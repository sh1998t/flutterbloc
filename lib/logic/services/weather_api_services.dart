import 'package:bloc_dars/data/constans/url_const.dart';
import 'package:bloc_dars/data/models/weather.dart';
import 'package:dio/dio.dart';

class WeatherApiServices {
  final Dio dio;
  WeatherApiServices({required this.dio});
  Future<Weather> getWeather(String city) async {
    final url = "$BaseUrl?q=${city.toLowerCase()}&units=metric&appid=${ApiKey}";
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      rethrow;
    }
  }
}
