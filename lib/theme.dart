import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      backgroundColor: Color(0xffecf3fe),
      brightness: Brightness.light,
      primaryColor: Color(0xff5a1bee),
      cardColor: Color(0xff642ff3),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.grey,
      cardColor: Colors.black26
    );
  }
}
//   static ThemeData getCurrentTheme(BuildContext context) {
//     final themeMode = AdaptiveTheme.of(context).mode;
//     return themeMode == AdaptiveThemeMode.dark ? darkTheme() : lightTheme();
//   }
// }