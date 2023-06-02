// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];
}
