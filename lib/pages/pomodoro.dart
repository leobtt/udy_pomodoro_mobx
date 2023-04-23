import 'package:flutter/material.dart';
import 'package:udy_promodoro_mobx/components/entry_time.dart';
import 'package:udy_promodoro_mobx/components/stopwatch.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: const Stopwatch()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                EntryTime(title: 'Trabalho', value: 25),
                EntryTime(title: 'Descanso', value: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
