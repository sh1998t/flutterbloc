import 'package:bloc/bloc.dart';
import 'package:bloc_dars/data/models/weather.dart';
import 'package:bloc_dars/logic/reporisitories/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());
  Future<void> getWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeather(city);
      emit(WeatherData(weather));
    } catch (error) {
      emit(WeatherError(error.toString()));
    }
  }
}
