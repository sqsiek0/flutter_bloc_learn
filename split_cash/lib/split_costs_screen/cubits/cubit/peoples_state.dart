// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'peoples_cubit.dart';

class PeoplesState extends Equatable {
  final List<Person> peoples;
  final double wholeCash;

  const PeoplesState({
    required this.peoples,
    required this.wholeCash,
  });

  factory PeoplesState.initial() {
    return PeoplesState(
        peoples: [Person(name: "Me")], wholeCash: 0.0);
  }

  @override
  List<Object> get props => [peoples];
}
