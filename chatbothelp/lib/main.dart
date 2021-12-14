import 'package:chatbothelp/views/home.dart';
import 'package:chatbothelp/views/inicial_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: InicialPage(),
  ));
}
