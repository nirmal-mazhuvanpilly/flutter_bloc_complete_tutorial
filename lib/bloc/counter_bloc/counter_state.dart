import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterStateLoaded extends CounterState {
  final int? counter;
  final bool? isRed;

  CounterStateLoaded({this.counter, this.isRed});

  @override
  List<Object?> get props => [counter, isRed];
}
