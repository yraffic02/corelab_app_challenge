import 'package:corelab_app_challenge/pages/home/home_page.dart';
import 'package:corelab_app_challenge/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste CoreLab',
      theme: ThemeData(
        primaryColor: const Color(0xFF00B4CC),
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: Constants.buildRoutes(context),
    );
  }
}
