import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/add_costs_screen/adding_costs_main.dart';
import 'package:split_cash/add_costs_screen/cubits/currency/currency_cubit.dart';
import 'package:split_cash/home_screen/home_screen_main_file.dart';
import 'package:split_cash/split_costs_screen/split_screen_main.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CurrencyCubit currencyCubit = CurrencyCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: currencyCubit,
                ),
              ],
              child: const HomeScreen(),
            ),
        '/costs': (context) => BlocProvider.value(
              value: currencyCubit,
              child: const AddCostsMain(),
            ),
        '/split' : (context) => const SplitScreenMain()
      },
    );
  }
}
