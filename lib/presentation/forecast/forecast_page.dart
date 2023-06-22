import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForecastPage extends StatefulWidget {
  final String selectedCity;

  const ForecastPage({Key? key, required this.selectedCity}) : super(key: key);

  @override
  _ForecastPageState createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  List<WeatherData> weatherData = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    const apiKey = '4fc48c421a302cd92905b289e1dcd3b6&cnt';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=${widget.selectedCity}&appid=4fc48c421a302cd92905b289e1dcd3b6&cnt=7&units=metric';



  final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<dynamic> forecasts = data['list'];

      setState(() {
        weatherData =
            forecasts.map((forecast) => WeatherData.fromMap(forecast)).toList();
      });
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5a1bee),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          final weather = weatherData[index];
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xffecf3fe),
              border: Border.all(color: Color(0xff3d4a73)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              //leading: const Icon(Icons.calendar_today, color: Color(0xff3d4a73)),
              title: Text(
                'Day ${index + 1}',
                style: TextStyle(
                    color: Color(0xff3d4a73),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              
              subtitle: Text(
                'Temperature: ${weather.temperature}°C',
                style: TextStyle(
                    color: Color(0xff3d4a73),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WeatherData {
  final DateTime date;
  final double temperature;

  WeatherData({required this.date, required this.temperature});

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000);
    final double temperature = map['main']['temp'].toDouble();
    return WeatherData(date: date, temperature: temperature);
  }
}