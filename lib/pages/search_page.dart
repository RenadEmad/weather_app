import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Search a city',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter a city',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              label: Text('Search'),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              try {
                WeatherModel weather =
                    await service.getWeather(cityName: cityName!);
                weatherData = weather;
                if (context.mounted) {
                  Navigator.pop(context);
                }
              } catch (e) {
                print('Error fetching weather data: ${e.toString()}');
              }
            },
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherData;
