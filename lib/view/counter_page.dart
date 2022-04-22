import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_event.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                state.toString(),
                style: const TextStyle(fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Increment());
                      },
                      child: const Icon(Icons.add)),
                  TextButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(Decrement());
                      },
                      child: const Icon(Icons.remove)),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
