import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

///forecast.json?key=eadaa6538a884eee95a233053241609&q=alexandria&days=1&aqi=no&alerts=no

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'eadaa6538a884eee95a233053241609';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
      return weather;
  }
  
}
