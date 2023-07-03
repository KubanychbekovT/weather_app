import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Color),),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
