import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter;
  bool isRed = false;

  CounterBloc({required this.counter})
      : super(CounterStateLoaded(counter: counter)) {
    on<IncrementCounter>(((event, emit) {
      counter = counter + 1;
      emit(CounterStateLoaded(counter: counter));
    }));

    on<DecrementCounter>(((event, emit) {
      counter = counter - 1;
      emit(CounterStateLoaded(counter: counter));
    }));

    on<SwitchColor>(((event, emit) {
      isRed = !isRed;
      emit(CounterStateLoaded(isRed: isRed, counter: counter));
    }));
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print(event);
    }
  }
}
