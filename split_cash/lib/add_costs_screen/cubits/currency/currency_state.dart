// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currency_cubit.dart';

class CurrencyState extends Equatable {
  final String currency;

  const CurrencyState({
    required this.currency,
  });

  factory CurrencyState.initial() {
    return const CurrencyState(currency: "PLN");
  }

  @override
  List<Object> get props => [currency];
}
