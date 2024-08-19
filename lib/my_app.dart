import 'package:corelab_app_challenge/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      theme: ThemeData(
        primaryColor: Color(0xFF00B4CC),
      ),
      home: HomeScreen(),
    );
  }
}
