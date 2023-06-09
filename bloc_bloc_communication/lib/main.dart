import 'package:bloc_bloc_communication/logic/bloc/counter_bloc.dart';
import 'package:bloc_bloc_communication/logic/bloc/theme_bloc.dart';
import 'package:bloc_bloc_communication/observer/app_observer.dart';
import 'package:bloc_bloc_communication/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(create: (context) => CounterBloc()),
    ],
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
