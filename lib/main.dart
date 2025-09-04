import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc_observer.dart';
import 'package:counter_app/EXhome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(home: HomePage()),
    );
  }
}
