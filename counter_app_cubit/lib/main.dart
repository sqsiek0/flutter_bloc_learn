import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_course/logic/couter/couter_cubit.dart';
import 'package:udemy_course/screens/home_page.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CouterCubit(),
    child: const MaterialApp(
      home: HomePageView(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
