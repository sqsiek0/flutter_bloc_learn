import 'package:flutter/material.dart';

class AddingCostsTextfields extends StatelessWidget {
  const AddingCostsTextfields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            textfieldFunction(
                const Icon(
                  Icons.shopping_bag_outlined,
                  size: 32,
                  color: Colors.black,
                ),
                "Description",
                TextInputType.text,
                TextInputAction.next),
            const SizedBox(
              height: 16,
            ),
            textfieldFunction(
                const Icon(Icons.money, size: 32, color: Colors.black),
                "0.00",
                TextInputType.number,
                TextInputAction.next),
            const SizedBox(
              height: 16,
            ),
            textfieldFunction(
                const Icon(Icons.date_range_outlined,
                    size: 32, color: Colors.black),
                "Date",
                TextInputType.number,
                TextInputAction.done),
          ],
        ),
      ),
    );
  }
}

Widget textfieldFunction(Icon textfieldIcon, String desc,
    TextInputType inputType, TextInputAction textInputAction) {
  return TextField(
    keyboardType: inputType,
    textInputAction: textInputAction,
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
