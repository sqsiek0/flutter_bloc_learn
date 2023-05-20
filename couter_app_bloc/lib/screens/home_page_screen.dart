import 'dart:math';

import 'package:couter_app_bloc/logic/bloc/theme_bloc.dart';
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
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ChangeThemeEvent(randInt: randInt));
                  },
                  child: const Text("Random number")))),
    );
  }
}
