import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'background_state.dart';

class BackgroundCubit extends Cubit<BackgroundState> {
  BackgroundCubit() : super(BackgroundState.initial());

  void changeColor(Color color) {
    if (color == Colors.red) {
      emit(const BackgroundState(color: Colors.blue));
    } else if (color == Colors.blue) {
      emit(const BackgroundState(color: Colors.green));
    } else if (color == Colors.green) {
      emit(const BackgroundState(color: Colors.black));
    } else if (color == Colors.black) {
      emit(const BackgroundState(color: Colors.red));
    }
  }
}
