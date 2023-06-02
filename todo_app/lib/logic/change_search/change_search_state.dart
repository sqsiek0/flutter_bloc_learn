// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'change_search_cubit.dart';

class ChangeSearchState extends Equatable {
  final String searchString;

  const ChangeSearchState({
    required this.searchString,
  });

  factory ChangeSearchState.initial() {
    return const ChangeSearchState(searchString: '');
  }

  @override
  List<Object> get props => [searchString];
}
