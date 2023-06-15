import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> containerData = [
      {
        'image': 'assets/images/cloudy.svg',
        'time': DateFormat('hh:mm a').format(DateTime.now()),
        'temperature': '25°C',
      },
      {
        'image': 'assets/images/rainy.svg',
        'time': DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 3))),
        'temperature': '28°C',
      },
      {
        'image': 'assets/images/snowy.svg',
        'time': DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 6))),
        'temperature': '23°C',
      },
      {
        'image': 'assets/images/storm.svg',
        'time': DateFormat('hh:mm a').format(DateTime.now().add(Duration(hours: 9))),
        'temperature': '20°C',
      },
    ];

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
                child: SvgPicture.asset(data['image']),
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
