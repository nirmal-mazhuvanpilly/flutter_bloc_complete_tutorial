import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterState extends Equatable {
  CounterStateLoaded copyWith({int? counter, bool? isRed});
}

class CounterStateLoaded extends CounterState {
  final int? counter;
  final bool? isRed;

  CounterStateLoaded({this.counter, this.isRed});

  @override
  CounterStateLoaded copyWith({int? counter, bool? isRed}) {
    return CounterStateLoaded(
        counter: counter ?? this.counter, isRed: isRed ?? this.isRed);
  }

  @override
  List<Object?> get props => [counter, isRed];
}
