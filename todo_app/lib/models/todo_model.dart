// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = const Uuid();

enum Filter {
  active,
  done,
  all,
}

class ToDo extends Equatable {
  final String todoName;
  final String id;
  final bool isCompleted;

  ToDo({
    String? id,
    required this.todoName,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [todoName, id, isCompleted];
}
