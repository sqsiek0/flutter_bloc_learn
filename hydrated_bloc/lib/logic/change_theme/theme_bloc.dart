import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (state.color == ThemeData.light()) {
        emit(ThemeState(color: ThemeData.dark()));
      } else if (state.color == ThemeData.dark()) {
        emit(ThemeState(color: ThemeData.light()));
      }
    });
  }
}
