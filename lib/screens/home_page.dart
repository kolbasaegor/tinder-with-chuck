import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tinder_with_chuck/bloc/swipe/swipe_bloc.dart';
import 'package:tinder_with_chuck/models/joke.dart';
import 'package:tinder_with_chuck/widgets/circular_button.dart';
import 'package:tinder_with_chuck/widgets/joke_card.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _swipeBloc = SwipeBloc(GetIt.I<JokeRepository>());

  void _userSwipe(Joke joke, Velocity velocity) {
    final double offsetX = velocity.pixelsPerSecond.dx;
    final double offsetY = velocity.pixelsPerSecond.dy;

    if (offsetX == 0 && offsetY == 0) return;

    if (offsetY.abs() > offsetX.abs() && offsetY < 0) {
      _swipeBloc.add(SwipeTop(joke: joke));
      print('Swipe Top');
      return;
    }

    if (offsetX > 0) {
      _swipeBloc.add(SwipeRight(joke: joke));
      print('Swipe Right');
    } else {
      _swipeBloc.add(SwipeLeft(joke: joke));
      print('Swipe Left');
    }
  }

  @override
  void initState() {
    _swipeBloc.add(LoadInitialJokes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Tinder with Chuck"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/fav');
                },
                icon: const Icon(Icons.star))
          ],
        ),
        body: BlocBuilder<SwipeBloc, SwipeState>(
          bloc: _swipeBloc,
          builder: (context, state) {
            if (state is SwipeLoaded) {
              return SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Draggable(
                          feedback: JokeCard(joke: state.jokes[0]),
                          childWhenDragging: JokeCard(joke: state.jokes[1]),
                          child: JokeCard(joke: state.jokes[0]),
                          onDragEnd: (drag) =>
                              _userSwipe(state.jokes[0], drag.velocity)),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularButton(
                            color: Colors.red,
                            onPressed: () => {
                              _swipeBloc.add(SwipeLeft(joke: state.jokes[0]))
                            },
                            child: const Icon(Icons.thumb_down),
                          ),
                          CircularButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () => {
                              _swipeBloc.add(SwipeTop(joke: state.jokes[0]))
                            },
                            child: const Icon(Icons.star),
                          ),
                          CircularButton(
                            color: Colors.green,
                            onPressed: () => {
                              _swipeBloc.add(SwipeRight(joke: state.jokes[0]))
                            },
                            child: const Icon(Icons.thumb_up),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }

            if (state is SwipeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Internet connection error"),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.signal_wifi_connected_no_internet_4)
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          _swipeBloc.add(LoadInitialJokes());
                        },
                        child: const Text("Retry"))
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
