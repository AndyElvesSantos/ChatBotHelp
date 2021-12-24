import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      backgroundColor: Colors.white54,
      body: Center(
        child: Text("Second Screen"),
      ),
    );
  }
}
