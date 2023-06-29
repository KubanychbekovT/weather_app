import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final VoidCallback function;

  const StoryCircle({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
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
            // child: ClipOval(
            //   child: Image.network(
            //     'https://nature_image.com/200/200', // Replace with your image URL
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
