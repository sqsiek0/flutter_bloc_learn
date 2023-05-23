import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_bloc_communication/logic/bloc/theme_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final ThemeBloc themeBloc;
  late StreamSubscription themeSubscription;
  int stepSize = 1;

  CounterBloc({required this.themeBloc}) : super(CounterState.initial()) {
    themeSubscription = themeBloc.stream.listen(
      (event) {
        if (event.color == Colors.red) {
          stepSize = 1;
        } else if (event.color == Colors.blue) {
          stepSize = 10;
        } else if (event.color == Colors.green) {
          stepSize = 100;
        } else if (event.color == Colors.black) {
          stepSize = -100;
          add(ChangeCounterEvent());
        }
      },
    );

    on<ChangeCounterEvent>((event, emit) {
      emit(CounterState(counter: state.counter + stepSize));
    });
  }

  @override
  Future<void> close() {
    themeSubscription.cancel();
    return super.close();
  }
}
