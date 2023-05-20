import 'dart:math';

import 'package:change_theme_cubit/logic/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Changing Theme"),
      ),
      body: SafeArea(
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    final int randInt = Random().nextInt(10);
                    print(randInt);
                    BlocProvider.of<ThemeCubit>(context).changeTheme(randInt);
                  },
                  child: const Text("Random number")))),
    );
  }
}
