import 'package:flutter/material.dart';
import 'package:prediciton_model/WelcomePage.dart';
import 'package:prediciton_model/predModel.dart';
import 'package:prediciton_model/Sustainable.dart';
import 'Sustainable.dart';
import 'WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
