import 'package:bloc_dars/logic/bloc/weather_cubit.dart';
import 'package:bloc_dars/logic/reporisitories/weather_repository.dart';
import 'package:bloc_dars/logic/services/weather_api_services.dart';
import 'package:bloc_dars/presentation/screens/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => WeatherRepository(
              weatherApiServices: WeatherApiServices(dio: Dio()),
            ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  WeatherCubit(context.read<WeatherRepository>()),
            )
          ],
          child: MaterialApp(
            title: 'Weather demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: HomeScreen(),
          ),
        ));
  }
}
