import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/logic/change_search/change_search_cubit.dart';
import 'package:todo_app/logic/counter_todo/counter_todo_cubit.dart';
import 'package:todo_app/logic/filter_list/filter_list_cubit.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';
import 'package:todo_app/logic/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app/screens/home_page_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(create: (context) => TodoFilterCubit()),
        BlocProvider<ChangeSearchCubit>(
            create: (context) => ChangeSearchCubit()),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<CounterTodoCubit>(
          create: (context) => CounterTodoCubit(
              todoListCubit: BlocProvider.of<TodoListCubit>(context),
              initialCounter:
                  BlocProvider.of<TodoListCubit>(context).state.todos.length),
        ),
        BlocProvider<FilterListCubit>(
          create: (context) => FilterListCubit(
              todoListCubit: BlocProvider.of<TodoListCubit>(context),
              changeSearchCubit: BlocProvider.of<ChangeSearchCubit>(context),
              todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
              initialTodo: BlocProvider.of<TodoListCubit>(context).state.todos),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
