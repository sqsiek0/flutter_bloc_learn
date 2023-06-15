import 'package:flutter/material.dart';
import 'package:split_cash/add_costs_screen/adding_costs_main.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/costs');
        },
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
            backgroundColor: MaterialStatePropertyAll(Color(0xff1f212b))),
        child: const Text(
          "Add costs",
          style: TextStyle(fontSize: 16),
        ));
  }
}
