import 'package:flutter/material.dart';
import 'package:tinder_with_chuck/features/circular_button.dart';
import 'package:tinder_with_chuck/features/joke_card.dart';
import 'package:tinder_with_chuck/models/joke.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';

class CardSwiper extends StatefulWidget {
  const CardSwiper({super.key});

  @override
  State<CardSwiper> createState() => _CardSwiperState();
}

class _CardSwiperState extends State<CardSwiper> {
  List<JokeCard> jokeCardList = [];
  int currentCardIndex = 0;

  @override
  void initState() {
    _insertNewJokes(3);
    super.initState();
  }

  void _updateJokeCardList() {
    if (jokeCardList.length < 5) _insertNewJokes(5);

    setState(() {
      jokeCardList.removeLast();
    });
  }

  void _insertNewJokes(int amount) async {
    for (int i = 0; i < amount; i++) {
      Joke newJoke = await JokeRepository().getRandomJoke();
      JokeCard newJokeCard = JokeCard(joke: newJoke);
      setState(() {
        jokeCardList.insert(0, newJokeCard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (jokeCardList.isEmpty)
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: jokeCardList.map((card) {
                  return Dismissible(
                    key: Key(card.joke.uuid),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      _updateJokeCardList();
                    },
                    background: Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Icon(Icons.thumb_up, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Icon(Icons.thumb_down, color: Colors.white),
                    ),
                    child: card,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularButton(
                    color: Colors.red,
                    onPressed: _updateJokeCardList,
                    child: const Icon(Icons.thumb_down),
                  ),
                  CircularButton(
                    color: Colors.green,
                    onPressed: _updateJokeCardList,
                    child: const Icon(Icons.thumb_up),
                  ),
                ],
              ),
            ],
          );
  }
}
