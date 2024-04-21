import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/screens/favourite_jokes_page.dart';
import 'package:tinder_with_chuck/screens/home_page.dart';

class TinderWithChuckApp extends StatelessWidget {
  const TinderWithChuckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tinder with Chuck App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: Colors.deepPurple,
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/fav': (context) => const FavouriteJokesScreen()
      },
    );
  }
}
