import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

List<Map<String, dynamic>> containerData = [
  {
    'image': 'assets/images/cloudy.svg',
    'time': '12:00 PM',
    'temperature': '25°C',
  },
  {
    'image': 'assets/images/rainy.svg',
    'time': '03:00 PM',
    'temperature': '28°C',
  },
  {
    'image': 'assets/images/snowy.svg',
    'time': '06:00 PM',
    'temperature': '23°C',
  },
  {
    'image': 'assets/images/sorm.svg',
    'time': '09:00 PM',
    'temperature': '20°C',
  },
];

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(containerData.length, (index) {
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
                  child: SvgPicture.asset(containerData[index]
                  ['image']
                  )),
              const SizedBox(height: 30),
              Text(containerData[index]['time'], style: const TextStyle(color: Colors.white, fontSize: 12),),
              const SizedBox(height: 5),
              Text(containerData[index]['temperature'], style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        );
      })
    );
  }
}