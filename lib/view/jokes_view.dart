import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_state.dart';
import 'package:flutter_bloc_complete_tutorial/view/counter_view.dart';

class JokesView extends StatelessWidget {
  const JokesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterInstance = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes View"),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is CounterStateLoaded) {
            debugPrint("CounterStateLoaded");
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterBloc, CounterState, int>(
                selector: (state) =>
                    (state is CounterStateLoaded) ? (state.counter ?? 0) : 0,
                builder: (context, snapshot) {
                  return Text(
                    snapshot.toString(),
                    style: const TextStyle(fontSize: 30),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocSelector<CounterBloc, CounterState, bool>(
                    selector: (state) => (state is CounterStateLoaded)
                        ? (state.isRed ?? false)
                        : false,
                    builder: (context, snapshot) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                snapshot ? Colors.red : Colors.blue,
                          ),
                          onPressed: () {
                            counterInstance.add(DecrementCounter());
                          },
                          child: const Text("-"));
                    }),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () {
                      counterInstance.add(IncrementCounter());
                    },
                    child: const Text("+")),
              ],
            ),
            TextButton(
                onPressed: () {
                  counterInstance.add(SwitchColor());
                },
                child: const Text("Switch Color")),
            const SizedBox(height: 20),
            Container(
                color: Colors.grey.shade200,
                child: TextFormField(controller: counterInstance.controller)),
            TextButton(
                onPressed: () {
                  if (kDebugMode) {
                    print(counterInstance.controller.text);
                  }
                },
                child: const Text("Get Text Form Field Value")),
            const SizedBox(height: 20),
            BlocBuilder<JokeBloc, JokeState>(
              builder: (context, state) {
                if (state is JokesLoadingState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<JokeBloc>(context)
                                .add(LoadJokeEvent());
                          },
                          child: const Text('Load New Joke'),
                        ),
                      ],
                    ),
                  );
                }
                if (state is JokesLoadedState) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.jokes?.category ?? "",
                          textAlign: TextAlign.center),
                      Text(state.jokes?.setup ?? "",
                          textAlign: TextAlign.center),
                      Text(state.jokes?.delivery ?? "",
                          textAlign: TextAlign.center),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<JokeBloc>(context)
                              .add(LoadJokeEvent());
                        },
                        child: const Text('Load New Joke'),
                      ),
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
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CounterView(),
                  ));
                },
                child: const Text("Next page")),
          ],
        ),
      ),
    );
  }
}
