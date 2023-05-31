import 'package:change_theme_cubit/logic/cubit/theme_cubit.dart';
import 'package:change_theme_cubit/screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          home: const HomePageView(),
        );
      },
    ),
  ));
}
