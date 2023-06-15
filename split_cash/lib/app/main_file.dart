import 'package:flutter/material.dart';
import 'package:split_cash/add_costs_screen/adding_costs_main.dart';
import 'package:split_cash/home_screen/home_screen_main_file.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/costs': (context) => const AddCostsMain()
      },
    );
  }
}
