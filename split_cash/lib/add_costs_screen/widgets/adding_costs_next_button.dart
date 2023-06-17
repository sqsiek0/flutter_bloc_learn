import 'package:flutter/material.dart';
import 'package:split_cash/add_costs_screen/adding_costs_main.dart';

class AddingCostsButton extends StatelessWidget {
  const AddingCostsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/split');
        },
        style: const ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
            backgroundColor: MaterialStatePropertyAll(Color(0xff1f212b))),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 16),
        ));
  }
}
