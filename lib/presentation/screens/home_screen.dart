import 'package:bloc_dars/logic/bloc/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().getWeather("Tashkent");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherError) {
          return Center(
            child: Text(state.massage),
          );
        } else if (state is WeatherData) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        state.weather.main,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        state.weather.desc,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        state.weather.city,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${state.weather.temperature}",
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
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
