import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/models/joke.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({super.key, required this.joke});

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 300,
        constraints: const BoxConstraints(
          minHeight: 500,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              joke.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(joke.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
