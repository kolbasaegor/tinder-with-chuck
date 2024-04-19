import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/features/card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: const SafeArea(
        child: Center(
          child: CardSwiper(),
        ),
      ),
    );
  }
}
