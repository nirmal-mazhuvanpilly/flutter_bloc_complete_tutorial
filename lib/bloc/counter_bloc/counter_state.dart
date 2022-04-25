import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterStateLoaded extends CounterState {
  final int? counter;
  CounterStateLoaded({this.counter});
  @override
  List<Object?> get props => [counter];
}
