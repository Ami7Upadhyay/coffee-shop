import 'package:coffie_shop/component/splash_screen.dart';
import 'package:coffie_shop/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
         fontFamily: 'Lato',
      ),
      home: const SplashScreen(),
    );
  }
}
