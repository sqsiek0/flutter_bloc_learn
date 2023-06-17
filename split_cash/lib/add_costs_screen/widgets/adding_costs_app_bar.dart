import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/add_costs_screen/cubits/currency/currency_cubit.dart';
import 'package:split_cash/home_screen/home_screen_main_file.dart';

class AddingCostsAppBar extends StatelessWidget {
  AddingCostsAppBar({super.key});
  final List<String> currency = ["PLN", "EUR", "USD"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Icon(
              Icons.cancel_outlined,
              size: 32,
              color: Colors.grey.shade600,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CurrencyCubit>(context),
                      child: const HomeScreen(),
                    ),
                  ),
                  ModalRoute.withName('/'));
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Add costs",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)),
                width: 75,
                child: Center(
                  child: BlocBuilder<CurrencyCubit, CurrencyState>(
                    builder: (context, state) {
                      return DropdownButton(
                        items: currency.map(buildList).toList(),
                        hint: const Text("PLN"),
                        value: state.currency,
                        onChanged: (value) {
                          BlocProvider.of<CurrencyCubit>(context)
                              .changeCurrency(value!);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildList(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontSize: 18),
      ));
}
