import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementCounter extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class DecrementCounter extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class SwitchColor extends CounterEvent {
  @override
  List<Object?> get props => [];
}
