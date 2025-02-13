import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/constans/url_const.dart';
import '../../data/models/weather.dart';

part 'weather_api_services.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String baseUrl}) = _WeatherApiService;

  @GET("/")
  Future<Weather> getWeather(
    @Query("q") String city,
    @Query("units") String units,
    @Query("appid") String apiKey,
  );
}
