import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter View"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          final CounterBloc counterInstance =
              BlocProvider.of<CounterBloc>(context);
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
                          counterInstance.add(DecrementCounter());
                        },
                        child: const Text("-")),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          counterInstance.add(IncrementCounter());
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
    );
  }
}
