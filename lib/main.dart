import 'package:flutter/material.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.yellow,
        cardTheme: const CardTheme(elevation: 10, color: Colors.yellow),
        appBarTheme: const AppBarTheme(color: Colors.black, centerTitle: true),
      ),
      home:
          //
          const MyHomePage(),
    );
  }
}
