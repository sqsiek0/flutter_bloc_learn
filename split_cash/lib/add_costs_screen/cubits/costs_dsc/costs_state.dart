// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'costs_cubit.dart';

class CostState extends Equatable {
  final CostModel costModel;

  const CostState({
    required this.costModel,
  });

  factory CostState.initial() {
    return CostState(
        costModel:
            CostModel(description: "", price: 0.0, dateTime: ""));
  }

  @override
  List<Object> get props => [costModel];
}
