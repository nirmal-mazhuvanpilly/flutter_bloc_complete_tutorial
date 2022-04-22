import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_complete_tutorial/model/jokes_model.dart';

@immutable
abstract class JokeState extends Equatable {}

class JokesLoadingState extends JokeState {
  @override
  List<Object?> get props => [];
}

class JokesLoadedState extends JokeState {
  final JokesModel? jokes;
  JokesLoadedState({this.jokes});
  @override
  List<Object?> get props => [jokes];
}

class JokesErrorState extends JokeState {
  final String? error;
  JokesErrorState({this.error});
  @override
  List<Object?> get props => [error];
}
