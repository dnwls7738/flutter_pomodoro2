import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<int> time = [900, 1200, 1500, 1800, 2100];

  int totalSeconds = 600;
  bool isRunning = false;
  int totalPomodorsos = 0;
  int totalGoal = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodorsos = totalPomodorsos + 1;
        isRunning = false;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }

    if (totalPomodorsos == 4) {
      setState(() {
        totalGoal = totalGoal + 1;
        totalPomodorsos = 0;
        isRunning = false;
        totalSeconds = 300;
      });
      timer.cancel();
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestarted() {
    setState(() {
      totalPomodorsos = 0;
      totalGoal = 0;
      isRunning = false;
      totalSeconds = 600;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: Text(
              "POMOTIMER",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      totalSeconds = time[0];
                    });
                  },
                  child: Text(
                    "15",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      totalSeconds = time[1];
                    });
                  },
                  child: Text(
                    "20",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      totalSeconds = time[2];
                    });
                  },
                  child: Text(
                    "25",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      totalSeconds = time[3];
                    });
                  },
                  child: Text(
                    "30",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2.0,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      totalSeconds = time[4];
                    });
                  },
                  child: Text(
                    "35",
                    style: TextStyle(
                        color: Theme.of(context).cardColor, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.displayLarge!.color,
                  ),
                ),
                Center(
                  child: IconButton(
                    iconSize: 50,
                    color: Theme.of(context).cardColor,
                    onPressed: onRestarted,
                    icon: const Icon(Icons.restart_alt_outlined),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$totalPomodorsos/4",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      Text(
                        'ROUND',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$totalGoal/12",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      Text(
                        'GOAL',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
