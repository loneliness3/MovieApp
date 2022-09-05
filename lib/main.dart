import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/screens.dart/home_scr.dart';
import 'package:movies/screens.dart/second_scr.dart';

void main() {
  
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> const HomeScr(),
        '/second_screen':(context) => Overview(),
      },
    );
  }
}
