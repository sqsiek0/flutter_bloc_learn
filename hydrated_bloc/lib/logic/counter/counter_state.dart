// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  factory CounterState.initial() {
    return const CounterState(counter: 0);
  }

  @override
  List<Object?> get props => [counter];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'counter': counter,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      counter: json['counter'] as int,
    );
  }
}
