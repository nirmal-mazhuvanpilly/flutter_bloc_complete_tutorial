import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/bloc/joke_bloc/jokes_bloc.dart';
import 'package:flutter_bloc_complete_tutorial/services/service_locator.dart';
import 'package:flutter_bloc_complete_tutorial/view/jokes_view.dart';

void main() async {
  await registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JokeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const JokesView(),
      ),
    );
  }
}
