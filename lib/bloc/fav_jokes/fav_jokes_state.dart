part of 'fav_jokes_bloc.dart';

sealed class FavJokesState extends Equatable {
  const FavJokesState();

  @override
  List<Object> get props => [];
}

class FavJokesLoading extends FavJokesState {}

class FavJokesLoaded extends FavJokesState {
  final List<Joke> jokes;

  const FavJokesLoaded({required this.jokes});

  @override
  List<Object> get props => [jokes];
}
