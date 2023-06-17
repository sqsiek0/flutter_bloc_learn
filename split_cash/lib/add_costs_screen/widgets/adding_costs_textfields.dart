import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

class AddingCostsTextfields extends StatefulWidget {
  const AddingCostsTextfields({super.key});

  @override
  State<AddingCostsTextfields> createState() => _AddingCostsTextfieldsState();
}

class _AddingCostsTextfieldsState extends State<AddingCostsTextfields> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                textfieldFunction(
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 32,
                      color: Colors.black,
                    ),
                    "Description",
                    TextInputType.text,
                    TextInputAction.next,
                    context),
                const SizedBox(
                  height: 16,
                ),
                textfieldFunction(
                    const Icon(Icons.money, size: 32, color: Colors.black),
                    "0.00",
                    TextInputType.number,
                    TextInputAction.next,
                    context),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: textEditingController,
                  maxLength: 10,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    // hintText: "Description",
                    label: const Text("Date"),
                    labelStyle: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.grey.shade500),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    prefixIcon: const Icon(Icons.date_range_outlined,
                        size: 32, color: Colors.black),
                  ),
                  onChanged: (value) {
                    if (value.length == 2 || value.length == 5) {
                      final newText = '$value/';
                      textEditingController.text = newText;
                      textEditingController.selection =
                          TextSelection.fromPosition(
                              TextPosition(offset: newText.length));
                    }
                    BlocProvider.of<CostCubit>(context).changeDate(value);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 162,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/split');
                },
                style: const ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff1f212b))),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}

Widget textfieldFunction(
    Icon textfieldIcon,
    String desc,
    TextInputType inputType,
    TextInputAction textInputAction,
    BuildContext context) {
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
    onChanged: (value) {
      if (inputType == TextInputType.number) {
        BlocProvider.of<CostCubit>(context).changePrice(double.parse(value));
      } else {
        BlocProvider.of<CostCubit>(context).changeDescription(value);
      }
    },
  );
}
