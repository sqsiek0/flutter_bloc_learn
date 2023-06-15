import 'package:flutter/material.dart';

class AddingCostsTextfields extends StatelessWidget {
  const AddingCostsTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          textfieldFunction(
              const Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Colors.black,
              ),
              "Description"),
          const SizedBox(
            height: 16,
          ),
          textfieldFunction(
              const Icon(Icons.money, size: 32, color: Colors.black), "0.00"),
          const SizedBox(
            height: 16,
          ),
          textfieldFunction(
              const Icon(Icons.date_range_outlined,
                  size: 32, color: Colors.black),
              "Date"),
        ],
      ),
    );
  }
}

Widget textfieldFunction(Icon textfieldIcon, String desc) {
  return TextField(
    decoration: InputDecoration(
        // hintText: "Description",
        label: Text(desc),
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
        ),
        floatingLabelStyle: TextStyle(color: Colors.grey.shade500),
        contentPadding: const EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.grey.shade300,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        prefixIcon: textfieldIcon),
    onSubmitted: (value) {},
  );
}
