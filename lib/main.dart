import 'package:flutter/material.dart';
import 'package:pranavdave/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      darkTheme: ThemeData(brightness: Brightness.light),
      title: 'Pranav Dave',
      home: const Home(),
    );
  }
}
