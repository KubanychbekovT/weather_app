import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11249F),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              cursorColor: Color(0xFF11249F),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF11249F))
                ),
                labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                labelText: 'Name',
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Color(0xFF11249F),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF11249F))
                ),
                labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                labelText: 'Surname',
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Color(0xFF11249F),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF11249F))
                ),
                labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                labelText: 'Email',
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Color(0xFF11249F),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF11249F))
                ),
                labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                labelText: 'Date of Birth',
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              cursorColor: Color(0xFF11249F),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF11249F))
                ),
                labelStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                labelText: 'Phone',
              ),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF11249F),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                    },
                    child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
