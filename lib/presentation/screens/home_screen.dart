import 'package:bloc_dars/logic/bloc/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeather("Tashkent");
  }

  String getWeatherBackground(String main) {
    switch (main) {
      case "Clear":
        return "assets/images/sunny.jpg";
      case "Clouds":
        return "assets/images/cloudy.jpg";
      case "Mist":
        return "assets/images/mist.jpeg";
      case "Rain":
        return "assets/images/rainy.jpg";
      case "Snow":
        return "assets/images/snow.jpg";
      default:
        return "assets/images/night.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherError) {
            return Center(child: Text(state.massage));
          } else if (state is WeatherData) {
            return Stack(
              children: [
                Image.asset(
                  getWeatherBackground(state.weather.main),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: "Enter city name",
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            String cityName = textEditingController.text.trim();
                            if (cityName.isNotEmpty) {
                              context.read<WeatherCubit>().getWeather(cityName);
                            }
                          },
                          child: Text("Get Weather"),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        state.weather.main,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        state.weather.icon,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        state.weather.desc,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Text(
                        state.weather.city,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      Center(
                        child: Text(
                          "Temperature: ${state.weather.temperature}°C",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "${state.weather.main}",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
