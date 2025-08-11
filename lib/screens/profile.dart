import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _CardAppState();
}

class _CardAppState extends State<Profile> {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    image: DecorationImage(
                      image:
                          AssetImage("assets/no.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                 
            Padding(
              padding: const EdgeInsets.only(left: 270),
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('Logout'),
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
