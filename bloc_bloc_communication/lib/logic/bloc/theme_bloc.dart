import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (state.color == Colors.red) {
        emit(const ThemeState(color: Colors.blue));
      } else if (state.color == Colors.blue) {
        emit(const ThemeState(color: Colors.green));
      } else if (state.color == Colors.green) {
        emit(const ThemeState(color: Colors.black));
      } else if (state.color == Colors.black) {
        emit(const ThemeState(color: Colors.red));
      }
    });
  }
}
