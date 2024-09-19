import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, weatherProvider, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: weatherProvider.weatherData == null
                ? Colors.green
                : weatherProvider.weatherData!.getColor(),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
