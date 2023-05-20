part of 'theme_bloc.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeState extends Equatable {
  final AppTheme appTheme;

  factory ThemeState.initial() {
    return const ThemeState(appTheme: AppTheme.light);
  }

  const ThemeState({this.appTheme = AppTheme.light});

  @override
  List<Object?> get props => [appTheme];
}
