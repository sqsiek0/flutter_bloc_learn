part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {}

class ChangeCounterEvent extends CounterEvent {
  final int counterSize;

  ChangeCounterEvent({required this.counterSize});

  @override
  List<Object?> get props => [counterSize];
}
