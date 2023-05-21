part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  const CounterState({required this.counter});

  @override
  List<Object?> get props => [counter];
}
