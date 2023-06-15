import 'package:flutter/material.dart';
import 'package:weather/application/services/weather_api_client.dart';
import 'package:weather/domain/models/weather_model.dart';
import 'package:weather/presentation/weather/widgets/weather_stat.dart';

class Search extends StatefulWidget {
  final Function(String) onCitySelected;

  const Search({super.key, required this.onCitySelected});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  WeatherApiClient client = WeatherApiClient();
  Weather? weather;

  void searchCity(String city) async {
    if (city.isNotEmpty) {
      widget.onCitySelected(city);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          style: const TextStyle(
            color: Colors.black,
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            searchCity(value);
          },
          decoration: InputDecoration(
            suffix: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                searchCity(_searchController.text);
              },
            ),
            hintStyle: const TextStyle(color: Color(0xff3d4a73), fontSize: 20),
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xff3d4a73), width: 3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xff3d4a73), width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xff3d4a73), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
