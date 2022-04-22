import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_state.dart';

class JokesView extends StatelessWidget {
  const JokesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes View"),
      ),
      body: BlocBuilder<JokeBloc, JokeState>(
        builder: (context, state) {
          if (state is JokesLoadingState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
                },
                child: const Text('Load New Joke'),
              ),
            );
          }
          if (state is JokesLoadedState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.jokes?.category??""),
              ],
            ));
          }
          if (state is JokesErrorState) {
            return const Center(child: Text("Error to load data"));
          }
          return ElevatedButton(
            onPressed: () {
              BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
            },
            child: const Text('Load New Joke'),
          );
        },
      ),
    );
  }
}
