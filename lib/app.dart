import 'package:flutter/material.dart';
import 'package:timer/timer/timer.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme().copyWith(
          headline1: const TextStyle(
            color: Color(0xffeceff4),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff2F3543),
        primaryColor: const Color(0xff2F3543),
      ),
      home: const TimerPage(),
    );
  }
}
