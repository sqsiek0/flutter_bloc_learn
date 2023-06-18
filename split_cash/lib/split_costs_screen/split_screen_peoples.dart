// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:split_cash/split_costs_screen/cubits/cubit/peoples_cubit.dart';

import '../add_costs_screen/cubits/costs_dsc/costs_cubit.dart';

class SplitScreenPeoples extends StatelessWidget {
  const SplitScreenPeoples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: MyCustomHeader(maxHeight: 33, minHeight: 33)),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            BlocBuilder<PeoplesCubit, PeoplesState>(
              builder: (context, state) {
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Card(
                    color: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 4,
                    child: ListTile(
                      trailing: Container(
                        width: 70,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                            child: Text(
                          "0.0",
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade600),
                        )),
                      ),
                      title: Text(
                        state.peoples[index].name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                }, childCount: state.peoples.length));
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomHeader extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;

  MyCustomHeader({
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<CostCubit, CostState>(
          builder: (context, state) {
            return Text(
              state.costModel.description,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            );
          },
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        )
      ],
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
