import 'package:flutter/material.dart';
import 'package:gallery/views/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_library_outlined, color: Colors.black, size: 30,),
              SizedBox(
                width: 10,
              ),
              Text('Gallery', style: TextStyle(color: Colors.black, fontSize: 25.0),)
            ],
          ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}

