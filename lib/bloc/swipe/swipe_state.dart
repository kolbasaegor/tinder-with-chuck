part of 'swipe_bloc.dart';

abstract class SwipeState {}

class SwipeLoading extends SwipeState {}

class SwipeLoaded extends SwipeState {
  SwipeLoaded({required this.jokes});

  final List<Joke> jokes;
}

class SwipeError extends SwipeState {
  SwipeError({required this.error});

  final Object? error;
}
