import '../../data/constans/url_const.dart';
import '../../data/models/weather.dart';
import '../services/weather_api_services.dart';

class WeatherRepository {
  final WeatherApiService apiService;

  WeatherRepository(this.apiService);

  Future<Weather> fetchWeather(String city) async {
    return await apiService.getWeather(city, "metric", ApiKey);
  }
}
