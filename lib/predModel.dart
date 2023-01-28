import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
//import 'dart:math';
//import 'package:math_expressions/math_expressions.dart';

class PredModel extends StatefulWidget {
  @override
  _PredModelState createState() => _PredModelState();
}

class _PredModelState extends State<PredModel> {
  var predValue = "";
  @override
  void initState() {
    super.initState();
    predValue = "Click predict button";
  }

  final N_Controller = TextEditingController();
  final P_Controller = TextEditingController();
  final K_Controller = TextEditingController();
  // final Temp_Controller = TextEditingController();              //del
  // final Humidity_Controller = TextEditingController();          //del
  final Ph_Controller = TextEditingController();
  final Rain_Controller = TextEditingController(); //del
  final Temprature_Controller = TextEditingController();
  final Humidity_Controller = TextEditingController();

  var Temp_api;
  var Humidity_api;

  Future<void> predData() async {
    //String strr
    final interpreter = await Interpreter.fromAsset('ml_model.tflite');
    //var input = [ [90.0,42.0,43.0,20.0,82.0,6.0,202.0] ];
    var N_ = double.parse(N_Controller.text);
    var P_ = double.parse(P_Controller.text);
    var K_ = double.parse(K_Controller.text);
    //var Temp_ = double.parse(Temp_Controller.text);
    //var Humidity_ = double.parse(Humidity_Controller.text);
    var Ph_ = double.parse(Ph_Controller.text);
    var Rain_ = double.parse(Rain_Controller.text);
    var Temprature_ = double.parse(Temprature_Controller.text);
    var Humidity_ = double.parse(Humidity_Controller.text);

    //var input = [ [ N_Controller.text, P_Controller.text, K_Controller.text, Temp_Controller.text, Humidity_Controller.text, Ph_Controller.text, Rain_Controller.text       ]  ];
    //var input =[[  onePointOne,onePointOne,onePointOne,onePointOne,onePointOne,onePointOne,onePointOne  ]];
    //print(strr);
    var input = [
      [N_, P_, K_, Temprature_, Humidity_, Ph_, Rain_]
    ];

    print('THis is controllers input');
    print(N_Controller.text + ' N_Controller.text');
    print(P_Controller.text + ' P_Controller.text');
    print(K_Controller.text + ' K_Controller.text');
    // print(  Temp_Controller.text + ' Temp_Controller.text');
    // print(  Humidity_Controller.text + ' Humidity_Controller.text');
    print(Ph_Controller.text + ' Ph_Controller.text');
    print(Rain_Controller.text + ' Rain_Controller.text');
    print(Temprature_Controller.text + ' City_Controller.text');
    print(Humidity_Controller.text + ' City_Controller.text');

    var output = List.filled(22, 0).reshape([1, 22]);
    interpreter.run(input, output);
    //print(output);
    print(output[0]);
    print(output[0][0]);
    //print(output[0].reduce(max));

    var x = 0;
    var maax = output[0][0];
    var index = 0;
    for (x; x < 22; x++) {
      if (output[0][x] > maax) {
        maax = output[0][x];
        index = x;
      }
    }
    print(maax);
    print(index);

    this.setState(() {
      //predValue = "abhi";//index.toString();//output[0][0].toString();
      if (index == 0) predValue = 'Apple';
      if (index == 1) predValue = 'Banana';
      if (index == 2) predValue = 'Black Gram';
      if (index == 3) predValue = 'Chickapea';
      if (index == 4) predValue = 'Coconut';
      if (index == 5) predValue = 'Coffee';
      if (index == 6) predValue = 'Cotton';
      if (index == 7) predValue = 'Grapes';
      if (index == 8) predValue = 'Jute';
      if (index == 9) predValue = 'kidneybeans';
      if (index == 10) predValue = 'Lentil';
      if (index == 11) predValue = 'Maize';
      if (index == 12) predValue = 'Mango';
      if (index == 13) predValue = 'mothbeans';
      if (index == 14) predValue = 'mungbean';
      if (index == 15) predValue = 'Muskmelon';
      if (index == 16) predValue = 'Orange';
      if (index == 17) predValue = 'Papaya';
      if (index == 18) predValue = 'pigeonpeas';
      if (index == 19) predValue = 'Pomegranate';
      if (index == 20) predValue = 'Rice';
      if (index == 21) predValue = 'Watermelon';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 249, 195),
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              // N
              controller: N_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Nitrogen Content',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            TextField(
              // P
              controller: P_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Phosphorus Content',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            TextField(
              // K
              controller: K_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Potassium Content',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            // TextField(                                           // Temp
            //   controller: Temp_Controller,
            //   keyboardType: TextInputType.number,
            //   textAlign: TextAlign.left,
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'PLEASE ENTER Temprature',
            //     hintStyle: TextStyle(color: Colors.grey),
            //   ),
            // ),

            // TextField(                                            // Humidity
            //   controller: Humidity_Controller,
            //   keyboardType: TextInputType.number,
            //   textAlign: TextAlign.left,
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     hintText: 'PLEASE ENTER Humidity Content',
            //     hintStyle: TextStyle(color: Colors.grey),
            //   ),
            // ),

            TextField(
              // Ph
              controller: Ph_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Ph value',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            TextField(
              // Rain
              controller: Rain_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Rain Content',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            TextField(
              // temprature
              controller: Temprature_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Temprature ',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
            TextField(
              // humidity
              controller: Humidity_Controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter : Humidity Content',
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),

            // Text(
            //   "change the input values in code to get the prediction",
            //   style: TextStyle(fontSize: 16),
            // ),

            SizedBox(height: 12),
            MaterialButton(
              color: Colors.green,
              child: Text(
                "Predict",
                style: TextStyle(fontSize: 25),
              ),

              onPressed: predData,
              //onPressed: () {
              //  predData( 'abhi' );
              //},
            ),
            SizedBox(height: 12),
            Text(
              "Predicted value :  $predValue ",
              style: TextStyle(color: Colors.black, fontSize: 23),
            ),
          ],
        ),
      ),
    );
  }
}
