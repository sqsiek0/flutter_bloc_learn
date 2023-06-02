// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ChangeThemeEvent>((event, emit) {
      if (state.color == ThemeData.light()) {
        emit(ThemeState(color: ThemeData.dark()));
      } else if (state.color == ThemeData.dark()) {
        emit(ThemeState(color: ThemeData.light()));
      }
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    print("json: $json");
    final themeState = ThemeState.fromJson(json);
    print("themeState: $themeState");
    return themeState;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    print("state: $state");
    final themeJson = state.toJson(state);
    print("themeState: $themeJson");
    return themeJson;
  }
}
