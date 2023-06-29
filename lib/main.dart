import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:weather/presentation/core/widgets/app_widget.dart';
import 'package:weather/theme.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme(),
      dark: AppTheme.darkTheme(),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Weather',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: '/',
        home: AppWidget(),
      ),
    );
  }
}
