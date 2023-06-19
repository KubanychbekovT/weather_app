import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HourlyWeather extends StatefulWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  _HourlyWeatherState createState() => _HourlyWeatherState();
}

class _HourlyWeatherState extends State<HourlyWeather> {
  late Timer _timer;
  late List<Map<String, dynamic>> containerData;

  @override
  void initState() {
    super.initState();
    containerData = [];
    _fetchWeatherData();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(hours: 1), (_) {
      _fetchWeatherData();
    });
  }

  Future<void> _fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=Bishkek&appid=4fc48c421a302cd92905b289e1dcd3b6'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> list = data['list'];
      setState(() {
        containerData = list.sublist(0, 4).map((item) {
          final DateTime time = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
          final String temperature = '${(item['main']['temp'] - 273.15).toStringAsFixed(1)}°C';
          final String image = _getWeatherImage(item['weather'][0]['icon']);
          return {
            'image': image,
            'time': DateFormat('hh:mm a').format(time),
            'temperature': temperature,
          };
        }).toList();
      });
    } else {
      setState(() {
        containerData = [];
      });
    }
  }

  String _getWeatherImage(String iconCode) {
    return 'http://openweathermap.org/img/w/$iconCode.png';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(containerData.length, (index) {
        final data = containerData[index];
        final time = data['time'];
        final temperature = data['temperature'];

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff642ff3),
            borderRadius: BorderRadius.circular(10),
          ),
          height: 120,
          width: 70,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                height: 45,
                width: 60,
                child: Image.network(data['image']),
              ),
              const SizedBox(height: 30),
              Text(
                time,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 5),
              Text(
                temperature,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }
}
