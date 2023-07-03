import 'package:flutter/material.dart';
import 'package:weather/presentation/more/profile_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
              'Addition',
                style: TextStyle(
                  color: Color(0xff3d4a73),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                ),
              ],
            ),
            ),
            SizedBox(height: 30),
            Container(
              color: Colors.white,
              height: 70,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())
                  );
                },
                child: Center(
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow,
                      ),
                      child: Icon(Icons.person, color: Colors.black,),
                    ),
                    title: Text('Profile',
                    style: TextStyle(
                      color: Color(0xff3d4a73),
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),),
                    subtitle: Text('Personal data',
                    style: TextStyle(fontSize: 12),),
                    trailing: Icon(Icons.chevron_right_outlined),
                    ),
                  ),
              ),
              ),
          ],
        ),
      )
    );
  }
}
