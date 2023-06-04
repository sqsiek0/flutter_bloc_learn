import 'package:flutter/material.dart';

Widget homePageHeader() {
  return Padding(
    padding: const EdgeInsets.all(32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.15),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline,
                size: 28,
                color: Colors.grey.withOpacity(0.8),
              )),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "ToDo",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.withOpacity(0.15),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 28,
                color: Colors.grey.withOpacity(0.8),
              )),
        ),
      ],
    ),
  );
}
