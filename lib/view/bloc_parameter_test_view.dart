import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';

class BlocParameterTestView extends StatelessWidget {
  final CounterBloc counterBloc;
  const BlocParameterTestView({Key? key, required this.counterBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bloc Parameter Test")),
      body: Column(
        children: [
          BlocSelector<CounterBloc, CounterState, int>(
              selector: (state) =>
                  (state is CounterStateLoaded) ? (state.counter ?? 0) : 0,
              bloc: counterBloc,
              builder: (context, snapshot) {
                return Text(
                  snapshot.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              }),
          BlocBuilder<CounterBloc, CounterState>(
            bloc: counterBloc,
            builder: (context, state) {
              if (state is CounterStateLoaded) {
                return Column(
                  children: [
                    Text(
                      state.counter.toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              counterBloc.add(DecrementCounter());
                            },
                            child: const Text("-")),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              counterBloc.add(IncrementCounter());
                            },
                            child: const Text("+")),
                      ],
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
