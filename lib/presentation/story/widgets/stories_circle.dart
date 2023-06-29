import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  final function;

  const StoryCircle({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff5a1bee),
          ),
        ),
      ),
    );
  }
}