part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ChangeThemeEvent extends ThemeEvent {
  final int randInt;

  ChangeThemeEvent({required this.randInt});

  @override
  List<Object?> get props => [randInt];
}
