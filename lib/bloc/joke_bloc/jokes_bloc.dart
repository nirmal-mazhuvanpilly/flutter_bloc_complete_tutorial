import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_event.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_state.dart';
import 'package:flutter_bloc_complete_tutorial/services/api_services.dart';
import 'package:flutter_bloc_complete_tutorial/services/service_locator.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final apiServices = getIt.get<ApiServices>();
  JokeBloc() : super(JokesLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokesLoadingState());
      try {
        final jokes = await apiServices.getJokesData();
        emit(JokesLoadedState(jokes: jokes));
      } catch (e) {
        emit(JokesErrorState(error: e.toString()));
      }
    });
  }
}
