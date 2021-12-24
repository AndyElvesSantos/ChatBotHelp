//importações necessárias
import 'package:chatbothelp/views/home.dart';
import 'package:chatbothelp/views/inicial_page.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';

//Primeria página do Chat
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: MyHomePage(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "inicio.png",
      text: "Chatbot Help",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}
