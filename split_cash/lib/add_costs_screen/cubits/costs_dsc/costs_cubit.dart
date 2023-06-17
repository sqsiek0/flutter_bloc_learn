import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/cost_model.dart';

part 'costs_state.dart';

class CostsCubit extends Cubit<CostsState> {
  CostsCubit() : super(CostsInitial());
}
