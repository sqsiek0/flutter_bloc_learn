part of 'theme_cubit.dart';

enum ThemeApp {
  light,
  dark,
}

class ThemeState extends Equatable {
  // final ThemeApp themeApp;
  final ThemeData themeData;

  factory ThemeState.initial() {
    return ThemeState(themeData: ThemeData.light());
  }

  const ThemeState({required this.themeData});

  @override
  List<Object?> get props => [themeData];
}
