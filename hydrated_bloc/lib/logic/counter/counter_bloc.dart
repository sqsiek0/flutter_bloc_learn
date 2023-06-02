// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(counter: state.counter - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print("json: $json");
    final counterState = CounterState.fromJson(json);
    print("counterState: $counterState");
    return counterState;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print("state: $state");
    final counterJson = state.toJson();
    print("counterState: $counterJson");
    return counterJson;
  }
}
