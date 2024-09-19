import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(); // No need for updatedUi
                }));
              },
              icon: const Icon(
                Icons.search,
                size: 28,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: const Text(
          'WeatherApp',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, weatherProvider, child) {
          WeatherModel? weatherData = weatherProvider.weatherData;

          return weatherData == null
              ? const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'There is no weather',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Text(
                        'Start searching for now',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      )
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        weatherData.getColor(),
                        weatherData.getColor()[300]!,
                        weatherData.getColor()[100]!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        weatherProvider.cityName ?? '',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(weatherData.date,
                          style: const TextStyle(
                            fontSize: 18,
                          )),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weatherData.getImage(),
                              errorBuilder: (context, error, stackTrace) {
                            return const Text('Error loading image');
                          }),
                          Text(
                            weatherData.temp.toInt().toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          Column(
                            children: [
                              Text(
                                'max: ${weatherData.maxTemp.toInt()}',
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                'min: ${weatherData.minTemp.toInt()}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Text(
                        weatherData.weatherStateName,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
