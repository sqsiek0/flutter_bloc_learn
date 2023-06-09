// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_list_cubit.dart';

class FilterListState extends Equatable {
  final List<ToDo> filteredList;

  const FilterListState({
    required this.filteredList,
  });

  factory FilterListState.initial() {
    return const FilterListState(filteredList: []);
  }

  @override
  List<Object> get props => [filteredList];
}
