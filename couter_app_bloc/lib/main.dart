import 'package:couter_app_bloc/logic/bloc/theme_bloc.dart';
import 'package:couter_app_bloc/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const HomePageView(),
        );
      },
    ),
  ));
}
