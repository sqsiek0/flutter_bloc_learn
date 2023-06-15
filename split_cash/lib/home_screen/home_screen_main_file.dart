import 'package:flutter/material.dart';
import 'package:split_cash/home_screen/widgets/home_screen_app_bar.dart';
import 'package:split_cash/home_screen/widgets/home_screen_button.dart';
import 'package:split_cash/home_screen/widgets/home_screen_costs_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        HomePageAppBar(),
        HomeScreenCostsInfo(),
        Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: HomePageButton(),
                )))
      ],
    )));
  }
}
