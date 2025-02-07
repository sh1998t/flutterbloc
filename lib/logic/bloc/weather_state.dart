part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherData extends WeatherState {
  final Weather weather;
  WeatherData(this.weather);
}

final class WeatherError extends WeatherState {
  final String massage;
  WeatherError(this.massage);
}
