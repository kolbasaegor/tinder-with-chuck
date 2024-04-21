import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_with_chuck/models/joke.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';

part 'fav_jokes_event.dart';
part 'fav_jokes_state.dart';

class FavJokesBloc extends Bloc<FavJokesEvent, FavJokesState> {
  final JokeRepository jokeRepository;

  FavJokesBloc(this.jokeRepository) : super(FavJokesLoading()) {
    on<LoadFavJokes>((event, emit) {
      final List<Joke> favJokes = jokeRepository.getJokesFromJokeBox();
      emit(FavJokesLoaded(jokes: favJokes));
    });

    on<RemoveAllJokes>((event, emit) async {
      emit(FavJokesLoading());
      jokeRepository.clearJokeBox();
      emit(const FavJokesLoaded(jokes: []));
    });
  }
}
