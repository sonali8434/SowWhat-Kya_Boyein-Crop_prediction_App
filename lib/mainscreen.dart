import 'package:flutter/material.dart';
import 'predModel.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainScreen"),
      ),
      body: Row(
        children: [
          ElevatedButton(
            child: Text("Go to Crop Prediction"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PredModel()));
            },
          ),
        ],
      ),
    );
  }
}
