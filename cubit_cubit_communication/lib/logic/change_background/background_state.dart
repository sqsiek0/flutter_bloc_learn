part of 'background_cubit.dart';

class BackgroundState extends Equatable {
  final Color color;

  factory BackgroundState.initial() {
    return const BackgroundState(color: Colors.red);
  }

  const BackgroundState({required this.color});

  @override
  List<Object?> get props => [color];
}
