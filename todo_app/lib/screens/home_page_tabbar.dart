import 'package:flutter/material.dart';

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
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
                height: 50,
                child: TabBar(
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
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
                    ])),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 393, //TODO: Change it to not specific number
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TabBarView(controller: _tabController, children: const [
                Center(child: Text("All")),
                Align(alignment: Alignment.bottomCenter, child: Text("Active")),
                Text("Done"),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
