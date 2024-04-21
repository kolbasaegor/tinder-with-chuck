import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tinder_with_chuck/bloc/fav_jokes/fav_jokes_bloc.dart';
import 'package:tinder_with_chuck/repositories/joke_repository.dart';

class FavouriteJokesScreen extends StatefulWidget {
  const FavouriteJokesScreen({super.key});

  @override
  State<FavouriteJokesScreen> createState() => _FavouriteJokesScreenState();
}

class _FavouriteJokesScreenState extends State<FavouriteJokesScreen> {
  final _favJokesBloc = FavJokesBloc(GetIt.I<JokeRepository>());

  @override
  void initState() {
    _favJokesBloc.add(LoadFavJokes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Your favourite jokes"),
        actions: [
          IconButton(
              onPressed: () {
                _favJokesBloc.add(RemoveAllJokes());
              },
              tooltip: "Remove all jokes from favourite",
              icon: const Icon(Icons.clear_all))
        ],
      ),
      body: BlocBuilder<FavJokesBloc, FavJokesState>(
        bloc: _favJokesBloc,
        builder: (context, state) {
          if (state is FavJokesLoaded) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  itemCount: state.jokes.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) => ListTile(
                    leading: SizedBox(
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          state.jokes[i].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text('${state.jokes[i].text.substring(0, 20)}...'),
                    subtitle: Text(state.jokes[i].text),
                  ),
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
