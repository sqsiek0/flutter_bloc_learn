import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

class SplitScreenMain extends StatelessWidget {
  const SplitScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: BlocBuilder<CostCubit, CostState>(
          builder: (context, state) {
            return Text(state.costModel.description);
          },
        ),
      ),
    ));
  }
}
