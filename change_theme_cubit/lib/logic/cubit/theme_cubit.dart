import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(int randInt) {
    if (randInt % 2 == 0) {
      emit(ThemeState(themeData: ThemeData.light()));
    } else {
      emit(ThemeState(themeData: ThemeData.dark()));
    }
  }
}
