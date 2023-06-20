import 'package:flutter/material.dart';
import 'package:weather/presentation/weather/weather_overview_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WeatherOverviewPage();
  }
}
