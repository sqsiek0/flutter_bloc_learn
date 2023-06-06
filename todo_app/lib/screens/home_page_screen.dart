import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/home_page_container_info.dart';
import 'package:todo_app/screens/home_page_header.dart';
import 'package:todo_app/screens/home_page_tabbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        homePageHeader(),
        todayProgress(context),
        const HomePageTabBar(),
      ],
    )));
  }
}
