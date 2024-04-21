part of 'fav_jokes_bloc.dart';

sealed class FavJokesEvent extends Equatable {
  const FavJokesEvent();

  @override
  List<Object> get props => [];
}

class LoadFavJokes extends FavJokesEvent {}

class RemoveAllJokes extends FavJokesEvent {}
