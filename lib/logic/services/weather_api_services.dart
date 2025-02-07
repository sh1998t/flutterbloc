import 'package:bloc_dars/data/constans/url_const.dart';
import 'package:bloc_dars/data/models/weather.dart';
import 'package:dio/dio.dart';

class WeatherApiServices {
  Future<Weather> getWeather(String city) async {
    final url = Uri.parse(
        "$BaseUrl?q=${city.toLowerCase()}&units=metric&appid=${ApiKey}");
    Dio dio = Dio();
    try {
      final response = await dio.get("$url");
      if (response.statusCode == 200 && response.statusCode == 201) {
        return Weather.fromJson(response.data);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (error) {
      rethrow;
    }
  }
}
