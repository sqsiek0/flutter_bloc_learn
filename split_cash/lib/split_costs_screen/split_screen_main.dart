import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/split_costs_screen/split_screen_app_bar.dart';
import 'package:split_cash/split_costs_screen/split_screen_peoples.dart';

import '../add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

class SplitScreenMain extends StatelessWidget {
  const SplitScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Column(
      children: [SplitScreenAppBar(), Expanded(child: SplitScreenPeoples())],
    )));
  }
}
