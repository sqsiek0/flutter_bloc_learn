import 'package:flutter/material.dart';
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
                    builder: (context) => const HomeScreen(),
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
                  child: DropdownButton(
                    items: currency.map(buildList).toList(),
                    hint: const Text("PLN"),
                    onChanged: (value) {},
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 32,
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
