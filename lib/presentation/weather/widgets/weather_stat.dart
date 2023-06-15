import 'package:flutter/material.dart';

Widget weatherStatWidget(String characteristic, String value) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          characteristic,
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Color(0xff323e61),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}