import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../logic/reporisitories/weather_repository.dart';
import '../logic/services/weather_api_services.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<WeatherApiService>(
      () => WeatherApiService(getIt<Dio>()));

  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepository(getIt<WeatherApiService>()));
}
