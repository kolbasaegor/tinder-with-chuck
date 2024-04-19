import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/features/home_page.dart';

class TinderWithChuckApp extends StatelessWidget {
  const TinderWithChuckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tinder with Chuck App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          backgroundColor: Color.fromARGB(255, 19, 49, 66),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(
        title: "Tinder with Chuck",
      ),
    );
  }
}
