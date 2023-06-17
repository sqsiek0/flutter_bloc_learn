import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/add_costs_screen/cubits/currency/currency_cubit.dart';

import '../add_costs_screen/cubits/costs_dsc/costs_cubit.dart';
import '../home_screen/home_screen_main_file.dart';

class SplitScreenAppBar extends StatelessWidget {
  const SplitScreenAppBar({super.key});

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
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  ModalRoute.withName('/'));
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "How we split",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              BlocBuilder<CostCubit, CostState>(
                builder: (context, state) {
                  return Text(
                    "Bill ${state.costModel.price} ${BlocProvider.of<CurrencyCubit>(context).state.currency}",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade500),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: Color(0xffdff169),
            thickness: 3,
          ),
        ],
      ),
    );
  }
}
