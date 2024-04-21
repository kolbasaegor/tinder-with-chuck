part of 'swipe_bloc.dart';

abstract class SwipeEvent {}

class LoadInitialJokes extends SwipeEvent {}

class SwipeLeft extends SwipeEvent {
  SwipeLeft({required this.joke});

  final Joke joke;
}

class SwipeRight extends SwipeEvent {
  SwipeRight({required this.joke});

  final Joke joke;
}

class SwipeTop extends SwipeEvent {
  SwipeTop({required this.joke});

  final Joke joke;
}
