import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int constTotalSeconds = 5;
  int totalSeconds = constTotalSeconds; // 25 minutes
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer; // late는 나중에 초기화 할 것이라는 뜻

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = constTotalSeconds;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    ); // 1초마다 onTick 함수 호출
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel(); // 타이머 취소(멈춤)
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = constTotalSeconds;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  String formatTime(int seconds) {
    var minutes = (seconds / 60).floor();
    var remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatTime(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 80,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: [
                Center(
                  child: IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_outline,
                    ),
                    iconSize: 100,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Center(
                  child: IconButton(
                    onPressed: onResetPressed,
                    icon: const Icon(Icons.restart_alt),
                    iconSize: 40,
                    color: Theme.of(context).cardColor,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(
                                  context,
                                ).textTheme.headlineLarge?.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(
                                  context,
                                ).textTheme.headlineLarge?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {}
}
