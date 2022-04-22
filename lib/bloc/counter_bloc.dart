import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}
