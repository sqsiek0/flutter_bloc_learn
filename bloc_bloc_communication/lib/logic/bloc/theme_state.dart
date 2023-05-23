part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final Color color;

  const ThemeState({required this.color});

  factory ThemeState.initial() {
    return const ThemeState(color: Colors.red);
  }

  @override
  List<Object?> get props => [color];
}
