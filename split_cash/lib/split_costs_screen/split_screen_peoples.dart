import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/split_costs_screen/cubits/cubit/peoples_cubit.dart';

import '../add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

class SplitScreenPeoples extends StatelessWidget {
  const SplitScreenPeoples({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CostCubit, CostState>(
                builder: (context, state) {
                  return Text(
                    state.costModel.description,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600),
                  );
                },
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  size: 32,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade600),
            child: BlocBuilder<PeoplesCubit, PeoplesState>(
              builder: (context, state) {
                return ListView.separated(
                  itemCount: state.peoples.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {},
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
