import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'couter_state.dart';

class CouterCubit extends Cubit<CounterState> {
  CouterCubit() : super(CounterState.initial());

  void increment() {
    emit(CounterState(counter: state.counter + 1));
  }

  void decrement() {
    emit(CounterState(counter: state.counter - 1));
  }
}
