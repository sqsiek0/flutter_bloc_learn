import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.notifications_none,
                size: 32,
                color: Colors.grey.shade700,
              )),
          InkWell(
              onTap: () {},
              child: Icon(
                Icons.person_3_outlined,
                size: 32,
                color: Colors.grey.shade700,
              )),
        ],
      ),
    );
  }
}
