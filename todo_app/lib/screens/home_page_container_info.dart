import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget todayProgress(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 175,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 76, 192, 238),
                Color.fromARGB(255, 20, 100, 199)
              ])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Today's progress",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "10 tasks",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                LinearPercentIndicator(
                  width: 120,
                  percent: 0.4,
                  progressColor: Colors.white,
                  barRadius: const Radius.circular(8),
                  trailing: const Text(
                    "40%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
            TextField()
          ],
        ),
      ),
    ),
  );
}
