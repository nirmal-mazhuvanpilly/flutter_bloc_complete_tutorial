import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc_complete_tutorial/view/bloc_parameter_test_view.dart';

class CounterView extends StatefulWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    super.initState();
    counterBloc = CounterBloc(counter: 0);
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterBlocTest = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter View"),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            bloc: counterBlocTest,
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
                              counterInstance.add(const DecrementCounter());
                            },
                            child: const Text("-")),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {
                              counterInstance.add(const IncrementCounter());
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
          BlocProvider<CounterBloc>.value(
            value: counterBloc,
            child: BlocBuilder<CounterBloc, CounterState>(
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
                                counterInstance.add(const DecrementCounter());
                              },
                              child: const Text("-")),
                          const SizedBox(width: 10),
                          ElevatedButton(
                              onPressed: () {
                                counterInstance.add(const IncrementCounter());
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
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BlocParameterTestView(counterBloc: counterBloc);
                  },
                ));
              },
              child: const Text("Bloc Parameter Test")),
        ],
      ),
    );
  }
}
