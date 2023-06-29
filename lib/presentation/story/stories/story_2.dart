import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyStory2 extends StatefulWidget {
  const MyStory2({Key? key}) : super(key: key);

  @override
  _MyStory2State createState() => _MyStory2State();
}

class _MyStory2State extends State<MyStory2> {
  late String imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRandomPhoto();
  }

  Future<void> fetchRandomPhoto() async {
    final response = await http.get(Uri.parse('https://api.unsplash.com/photos/random/?query=weather&client_id=Cuy4OEkNsvPao_Xe2o8TLSXYdUpzTzRPEzIyrNs0qaI'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        imageUrl = data['urls']['regular'];
        isLoading = false;
      });
    } else {
      // Обработка ошибки API
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (!isLoading)
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
