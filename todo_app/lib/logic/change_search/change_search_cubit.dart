import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_search_state.dart';

class ChangeSearchCubit extends Cubit<ChangeSearchState> {
  ChangeSearchCubit() : super(ChangeSearchState.initial());

  void changeSearchFunction(String search) {
    emit(ChangeSearchState(searchString: search));
  }
}
