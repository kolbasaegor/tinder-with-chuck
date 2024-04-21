import 'dart:math';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tinder_with_chuck/models/joke.dart';

part 'utils.dart';

class JokeRepository {
  final Dio dio;
  final Box<Joke> jokeBox;

  JokeRepository({required this.dio, required this.jokeBox});

  Future<Joke> getRandomJoke() async {
    final chuckApiResponse =
        await dio.get("https://api.chucknorris.io/jokes/random");
    final chuckData = chuckApiResponse.data;

    final Map<String, dynamic> jsonJoke = {
      "uuid": chuckData["id"],
      "text": chuckData["value"],
      "imageUrl": imageUrls[Random().nextInt(imageUrls.length)]
    };

    return Joke.fromJson(jsonJoke);
  }

  Future<List<Joke>> getJokes(int number) async {
    List<Joke> jokes = [];

    for (var i = 0; i < number; i++) {
      final Joke joke = await getRandomJoke();
      jokes.add(joke);
    }

    return jokes;
  }

  void saveJokeToJokeBox(Joke joke) {
    jokeBox.add(joke);
  }

  void clearJokeBox() {
    jokeBox.clear();
  }

  List<Joke> getJokesFromJokeBox() {
    return jokeBox.values.toList();
  }
}
