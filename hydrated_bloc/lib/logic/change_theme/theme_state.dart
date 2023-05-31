part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData color;

  const ThemeState({required this.color});

  factory ThemeState.initial() {
    return ThemeState(color: ThemeData.light());
  }

  @override
  List<Object?> get props => [color];
}
