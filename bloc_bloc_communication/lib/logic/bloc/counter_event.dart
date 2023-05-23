part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class ChangeCounterEvent extends CounterEvent {}
