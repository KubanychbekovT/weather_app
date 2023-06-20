import 'package:flutter/material.dart';
import 'package:weather/application/services/weather_api_client.dart';
import 'package:weather/application/services/city_api_client.dart';
import 'package:weather/domain/models/weather_model.dart';

class Search extends StatefulWidget {
  final Function(String) onCitySelected;

  const Search({Key? key, required this.onCitySelected}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  OpenCageApiClient client = OpenCageApiClient('0d2721ad4c334bb5a6a9015de89caa63');
  Weather? weather;

  List<String> citySuggestions = [];

  void searchCity(String city) async {
    if (city.isNotEmpty) {
      widget.onCitySelected(city);
    }
  }

  void getCitySuggestions(String query) async {
    try {
      if (query.isNotEmpty) {
        var suggestions = await client.getCitySuggestions(query);
        setState(() {
          citySuggestions = suggestions;
        });
      } else {
        setState(() {
          citySuggestions = [];
        });
      }
    } catch (e) {
      print('Error fetching city suggestions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.black),
            textInputAction: TextInputAction.search,
            onChanged: (value) {
              getCitySuggestions(value);
            },
            onSubmitted: (value) {
              searchCity(value);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {
                  searchCity(_searchController.text);
                },
              ),
              hintStyle: const TextStyle(
                color: Color(0xff3d4a73),
                fontSize: 20,
              ),
              hintText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff3d4a73),
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff3d4a73),
                  width: 3,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff3d4a73),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        if (citySuggestions.isNotEmpty)
          Container(
            height:30,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: citySuggestions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(citySuggestions[index]),
                  onTap: () {
                    _searchController.text = citySuggestions[index];
                    searchCity(citySuggestions[index]);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
