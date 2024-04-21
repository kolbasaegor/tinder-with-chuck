import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_with_chuck/models/joke.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';

part 'swipe_event.dart';
part 'swipe_state.dart';

class SwipeBloc extends Bloc<SwipeEvent, SwipeState> {
  final JokeRepository jokeRepository;

  SwipeBloc(this.jokeRepository) : super(SwipeLoading()) {
    on<LoadInitialJokes>((event, emit) => _loadInitialJokes(event, emit, 10));

    on<SwipeLeft>((event, emit) => _swipe(event, emit));

    on<SwipeRight>((event, emit) => _swipe(event, emit));

    on<SwipeTop>((event, emit) async {
      await _swipe(event, emit);
      jokeRepository.saveJokeToJokeBox(event.joke);
    });
  }

  _loadInitialJokes(state, emit, int amount) async {
    try {
      emit(SwipeLoading());
      final initialJokes = await jokeRepository.getJokes(amount);
      emit(SwipeLoaded(jokes: initialJokes));
    } catch (e) {
      emit(SwipeError(error: e));
    }
  }

  _swipe(event, emit) async {
    final currentState = state as SwipeLoaded;

    if (currentState.jokes.length < 3) {
      emit(SwipeLoading());
      await _loadJoke(emit, currentState.jokes);
    }

    List<Joke> newJokeList = List.from(currentState.jokes);
    newJokeList.remove(event.joke);

    emit(SwipeLoaded(jokes: newJokeList));

    await _loadJoke(emit, newJokeList);
  }

  _loadJoke(emit, jokeList) async {
    try {
      final Joke newJoke = await jokeRepository.getRandomJoke();
      jokeList.add(newJoke);

      emit(SwipeLoaded(jokes: jokeList));
    } catch (e) {
      emit(SwipeError(error: e));
    }
  }
}
