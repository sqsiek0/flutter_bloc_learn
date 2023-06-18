import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/add_costs_screen/adding_costs_main.dart';
import 'package:split_cash/add_costs_screen/cubits/costs_dsc/costs_cubit.dart';
import 'package:split_cash/add_costs_screen/cubits/currency/currency_cubit.dart';
import 'package:split_cash/home_screen/home_screen_main_file.dart';
import 'package:split_cash/split_costs_screen/cubits/cubit/peoples_cubit.dart';
import 'package:split_cash/split_costs_screen/split_screen_main.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CurrencyCubit currencyCubit = CurrencyCubit();
  final CostCubit costCubit = CostCubit();

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
        '/costs': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: currencyCubit,
                ),
                BlocProvider.value(
                  value: costCubit,
                ),
              ],
              child: const AddCostsMain(),
            ),
        '/split': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: costCubit,
                ),
                BlocProvider.value(
                  value: currencyCubit,
                ),
                BlocProvider(
                  create: (context) => PeoplesCubit(costCubit: costCubit),
                )
              ],
              child: const SplitScreenMain(),
            )
      },
    );
  }
}
