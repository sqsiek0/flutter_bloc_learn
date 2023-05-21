import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_cubit_communication/logic/change_background/background_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counterSize = 1;
  final BackgroundCubit backgroundCubit;
  late StreamSubscription backgroundSubscription;

  CounterCubit({required this.backgroundCubit})
      : super(CounterState.initial()) {
    backgroundSubscription = backgroundCubit.stream.listen((event) {
      if (event.color == Colors.blue) {
        counterSize = 10;
      } else if (event.color == Colors.green) {
        counterSize = 100;
      } else if (event.color == Colors.black) {
        emit(CounterState(counter: state.counter - 100));
        counterSize = -100;
      } else if (event.color == Colors.red) {
        counterSize = 1;
      }
    });
  }

  void changeCounter() {
    emit(CounterState(counter: state.counter + counterSize));
  }

  @override
  Future<void> close() {
    backgroundSubscription.cancel();
    return super.close();
  }
}
