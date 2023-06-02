// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData color;

  const ThemeState({required this.color});

  factory ThemeState.initial() {
    return ThemeState(color: ThemeData.light());
  }

  @override
  List<Object?> get props => [color];

  // Map<String, dynamic> toJson() {
  //   return <String, dynamic>{
  //     'color': color,
  //   };
  // }

  // factory ThemeState.fromJson(Map<String, dynamic> json) {
  //   return ThemeState(
  //     color: json['color'] as ThemeData,
  //   );
  // }

  String convertToJSON(dynamic variable) {
  if (variable is ThemeData) {
    return jsonEncode(variable);
  } else {
    return jsonEncode(variable);
  }
}

  Map<String, dynamic> toJson(ThemeState themeState) {
    return <String, dynamic>{
      'color': convertToJSON(themeState.color)
    };
  }

  // factory ThemeState.fromJson(ThemeData json) {
  //   return ThemeState(
  //     color: json,
  //   );
  // }


  factory ThemeState.fromJson(Map<String, dynamic> json) {
    return ThemeState(
      color: ThemeData.fromJson(json['color'] as ThemeState),
    );
  }
}
