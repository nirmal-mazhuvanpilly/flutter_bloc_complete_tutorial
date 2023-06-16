import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter;
  bool isRed = false;

  final TextEditingController controller = TextEditingController();

  CounterBloc({required this.counter})
      : super(CounterStateLoaded(counter: counter)) {
    on<IncrementCounter>(((event, emit) {
      counter = counter + (event.count ?? 1);
      emit(state.copyWith(counter: counter));
    }));

    on<DecrementCounter>(((event, emit) {
      counter = counter - (event.count ?? 1);
      emit(state.copyWith(counter: counter));
    }));

    on<SwitchColor>(((event, emit) {
      isRed = !isRed;
      emit(state.copyWith(isRed: isRed));
    }));
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print(event);
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
