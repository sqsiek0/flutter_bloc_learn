// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:split_cash/add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

import '../../models/person.dart';

part 'peoples_state.dart';

class PeoplesCubit extends Cubit<PeoplesState> {
  final CostCubit costCubit;
  late StreamSubscription costSubscription;

  PeoplesCubit({
    required this.costCubit,
  }) : super(PeoplesState.initial()) {
    costSubscription = costCubit.stream.listen((event) {
      final double newWholePrice = event.costModel.price;
      emit(PeoplesState(peoples: state.peoples, wholeCash: newWholePrice));
    });
  }

  void addPerson(Person newPerson) {
    emit(PeoplesState(
        peoples: [...state.peoples, newPerson], wholeCash: state.wholeCash));
  }

  @override
  Future<void> close() {
    costSubscription.cancel();
    return super.close();
  }
}
