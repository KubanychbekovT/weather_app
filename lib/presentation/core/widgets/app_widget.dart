import 'package:flutter/material.dart';
import 'package:weather/presentation/settings/settings.dart';
import 'package:weather/presentation/weather/weather_overview_page.dart';

import '../../image/images_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    WeatherOverviewPage(),
    ImagesPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF11249F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Weather',
            icon: Icon(Icons.nature_people_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Images',
            icon: Icon(Icons.image_aspect_ratio_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
    );
  }
}
