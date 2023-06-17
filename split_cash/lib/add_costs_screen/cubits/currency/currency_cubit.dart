import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyState.initial());

  void changeCurrency(String newCurrency) {
    emit(CurrencyState(currency: newCurrency));
  }
}
