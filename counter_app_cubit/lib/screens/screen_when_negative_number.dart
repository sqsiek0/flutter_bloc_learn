import 'package:flutter/material.dart';

class MinusScreen extends StatelessWidget {
  const MinusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Other"),
      ),
      body: const Center(
        child: Text(
          "Other",
          style: TextStyle(fontSize: 52),
        ),
      ),
    ));
  }
}
