import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/logic/filter_list/filter_list_cubit.dart';
import 'package:todo_app/logic/list_todo/list_todo_cubit.dart';
import 'package:todo_app/logic/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app/models/todo_model.dart';

class HomePageTabBar extends StatefulWidget {
  const HomePageTabBar({super.key});

  @override
  State<HomePageTabBar> createState() => _HomePageTabBarState();
}

class _HomePageTabBarState extends State<HomePageTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
              height: 50,
              child: TabBar(
                labelColor: Colors.white,
                labelStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                unselectedLabelStyle: const TextStyle(fontSize: 16),
                unselectedLabelColor: Colors.black38,
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 76, 192, 238),
                          Color.fromARGB(255, 20, 100, 199)
                        ])),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Active",
                  ),
                  Tab(
                    text: "Done",
                  ),
                ],
                onTap: (value) {
                  if (value == 0) {
                    BlocProvider.of<TodoFilterCubit>(context)
                        .changeFilter(Filter.all);
                  } else if (value == 1) {
                    BlocProvider.of<TodoFilterCubit>(context)
                        .changeFilter(Filter.active);
                  } else if (value == 2) {
                    BlocProvider.of<TodoFilterCubit>(context)
                        .changeFilter(Filter.done);
                  }
                },
              )),
        ),
        Expanded(
          child: SizedBox(
            // height: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TabBarView(controller: _tabController, children: [
                BlocBuilder<FilterListCubit, FilterListState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemCount: state.filteredList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.filteredList[index].todoName,
                          ),
                          tileColor: Colors.blue.shade100,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          leading: Checkbox(
                              value: state.filteredList[index].isCompleted,
                              onChanged: (value) {
                                BlocProvider.of<TodoListCubit>(context)
                                    .completeTodo(state.filteredList[index].id);
                              }),
                        );
                      },
                    );
                  },
                ),
                BlocBuilder<TodoListCubit, TodoListState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemCount: state.todos.length,
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 2,
                      ),
                      itemBuilder: (context, index) {
                        if (state.todos[index].isCompleted == false) {
                          return ListTile(
                            title: Text(state.todos[index].todoName),
                            leading: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
                BlocBuilder<TodoListCubit, TodoListState>(
                  builder: (context, state) {
                    return ListView.separated(
                      itemCount: state.todos.length,
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 2,
                      ),
                      itemBuilder: (context, index) {
                        if (state.todos[index].isCompleted == true) {
                          return ListTile(
                            title: Text(
                              state.todos[index].todoName,
                            ),
                            leading: Checkbox(
                              value: false,
                              onChanged: (value) {},
                            ),
                          );
                        }
                        return null;
                      },
                    );
                  },
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
