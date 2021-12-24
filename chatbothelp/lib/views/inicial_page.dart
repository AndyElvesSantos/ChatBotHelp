import 'package:chatbothelp/secondScreen.dart';
import 'package:chatbothelp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  _InicialPageState createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: MyHomePage(),
        duration: 3000,
        imageSize: 130,
        imageSrc: "",
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
