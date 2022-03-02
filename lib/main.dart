import 'package:coursework_2/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(displayColor: Colors.cyanAccent)
      ),
      home: HomePage(),
    );
  }
}