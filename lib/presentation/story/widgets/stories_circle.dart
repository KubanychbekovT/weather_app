import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoryCircle extends StatefulWidget {
  final VoidCallback function;

  const StoryCircle({Key? key, required this.function}) : super(key: key);

  @override
  _StoryCircleState createState() => _StoryCircleState();
}

class _StoryCircleState extends State<StoryCircle> {
  late String imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRandomImage();
  }

  Future<void> fetchRandomImage() async {
    final response =
    await http.get(Uri.parse('https://api.unsplash.com/photos/random/?query=weather&client_id1=Cuy4OEkNsvPao_Xe2o8TLSXYdUpzTzRPEzIyrNs0qaI'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final urls = data['urls'];
      setState(() {
        imageUrl = urls['regular'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: isLoading
                  ? CircularProgressIndicator()
                  : imageUrl != null
                  ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
              )
                  : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
