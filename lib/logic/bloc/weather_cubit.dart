import 'package:bloc/bloc.dart';
import 'package:bloc_dars/data/models/weather.dart';
import 'package:bloc_dars/logic/reporisitories/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;

  WeatherCubit(this.repository) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await repository.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Xatolik: ${e.toString()}"));
    }
  }
}
