import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/domain/models/weather_model.dart';

class WeatherApiClient {
  Future<Weather?>? getCurrentWeather(String? location) async {
    try{
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4fc48c421a302cd92905b289e1dcd3b6'
    );

    var response = await http.get(endpoint);
    
    if (response.statusCode == 200) {
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
} catch (e) {
  print('Error: $e');
  return null;
  }
}
}