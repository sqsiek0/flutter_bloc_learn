import 'package:bloc_bloc_communication/logic/bloc/counter_bloc.dart';
import 'package:bloc_bloc_communication/logic/bloc/theme_bloc.dart';
import 'package:bloc_bloc_communication/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider(
          create: (context) =>
              CounterBloc(themeBloc: BlocProvider.of<ThemeBloc>(context))),
    ],
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
