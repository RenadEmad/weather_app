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
      date: data['location']['localtime'] ?? 'Unknown',
      weatherStateName: jsonData['condition']['text'] ?? 'Unknown',
      temp: data['avgtemp_c'].toDouble() ?? 0.0,
      maxTemp: data['maxtemp_c'].toDouble() ?? 0.0,
      minTemp: data['mintemp_c'].toDouble() ?? 0.0,
    );
  }
  @override
  String toString() {
    return 'tem=$temp maxTemp=$maxTemp minTemp=$minTemp';
  }
}
