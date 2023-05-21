import 'package:cubit_cubit_communication/logic/change_background/background_cubit.dart';
import 'package:cubit_cubit_communication/logic/counter_value/counter_cubit.dart';
import 'package:cubit_cubit_communication/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BackgroundCubit>(
        create: (context) => BackgroundCubit(),
      ),
      BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(
            backgroundCubit: BlocProvider.of<BackgroundCubit>(context)),
      ),
    ],
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
