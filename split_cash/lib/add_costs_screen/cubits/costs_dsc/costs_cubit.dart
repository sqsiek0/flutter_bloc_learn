import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/cost_model.dart';

part 'costs_state.dart';

class CostCubit extends Cubit<CostState> {
  CostCubit() : super(CostState.initial());

  void changeDescription(String newDsc) {
    emit(CostState(
        costModel: CostModel(
            description: newDsc,
            price: state.costModel.price,
            dateTime: state.costModel.dateTime)));
  }

  void changePrice(double newPrice) {
    emit(CostState(
        costModel: CostModel(
            description: state.costModel.description,
            price: newPrice,
            dateTime: state.costModel.dateTime)));
  }

  void changeDate(String newDate) {
    emit(CostState(
        costModel: CostModel(
            description: state.costModel.description,
            price: state.costModel.price,
            dateTime: newDate)));
  }
}
