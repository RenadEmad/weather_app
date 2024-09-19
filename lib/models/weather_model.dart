import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  String weatherStateName;
  double temp;
  double maxTemp;
  double minTemp;

  WeatherModel(
      {required this.date,
      required this.weatherStateName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    print(jsonData);
    return WeatherModel(
      date: data['location']['localtime'],
      weatherStateName: jsonData['condition']['text'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
    );
  }
  @override
  String toString() {
    return 'tem=$temp maxTemp=$maxTemp minTemp=$minTemp';
  }

  String getImage() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'clear' || weatherStateName == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'rainy') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/snow.png';
    }
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return Colors.indigo;
    } else if (weatherStateName == 'cloudy') {
      return Colors.brown;
    } else if (weatherStateName == 'clear' || weatherStateName == 'Sunny') {
      return Colors.green;
    } else if (weatherStateName == 'rainy') {
      return Colors.grey;
    } else {
      return Colors.red;
    }
  }
}
