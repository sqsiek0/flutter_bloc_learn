import 'package:flutter/material.dart';
import 'package:split_cash/add_costs_screen/widgets/adding_costs_app_bar.dart';
import 'package:split_cash/add_costs_screen/widgets/adding_costs_next_button.dart';
import 'package:split_cash/add_costs_screen/widgets/adding_costs_textfields.dart';
import 'package:split_cash/home_screen/home_screen_main_file.dart';

class AddCostsMain extends StatelessWidget {
  const AddCostsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          AddingCostsAppBar(),
          const Expanded(child: AddingCostsTextfields()),
          // const Padding(
          //   padding: EdgeInsets.all(24),
          //   child: AddingCostsButton(),
          // ),
        ],
      )),
    );
  }
}
