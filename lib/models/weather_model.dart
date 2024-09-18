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
    // print(jsonData);
    return WeatherModel(
      date: data['location']['localtime'],
      weatherStateName: jsonData['condition']['text'],
      temp: data['avgtemp_c'],
      maxTemp: data['maxtemp_c'],
      minTemp: data['mintemp_c'],
    );
  }
  @override
  String toString() {
    return 'tem=$temp maxTemp=$maxTemp minTemp=$minTemp';
  }
}
