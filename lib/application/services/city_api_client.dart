import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenCageApiClient {
  final String apiKey;

  OpenCageApiClient(this.apiKey);

  Future<List<String>> getCitySuggestions(String query) async {
    var endpoint = Uri.parse(
        'https://api.opencagedata.com/geocode/v1/json?key=0d2721ad4c334bb5a6a9015de89caa63&q=$query&limit=5');

    var response = await http.get(endpoint);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var results = body['results'] as List<dynamic>;

      List<String> suggestions = results.map((result) {
        var components = result['components'] as Map<String, dynamic>;
        var city = components['city'] ?? '';
        var country = components['country'] ?? '';

        return '$city, $country';
      }).toList();

      return suggestions;
    } else {
      throw Exception('Failed to fetch city suggestions');
    }
  }
}

void main() async {
  var apiKey = '0d2721ad4c334bb5a6a9015de89caa63';
  var client = OpenCageApiClient(apiKey);

  try {
    var query = ''; // Поисковый запрос
    var suggestions = await client.getCitySuggestions(query);
    print(suggestions);
  } catch (e) {
    print('Error: $e');
  }
}
