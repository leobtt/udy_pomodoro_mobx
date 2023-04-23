import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:udy_promodoro_mobx/components/entry_time.dart';
import 'package:udy_promodoro_mobx/components/stopwatch.dart';
import 'package:udy_promodoro_mobx/store/pomodoro.store.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PomodoroStore store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Stopwatch()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntryTime(
                    title: 'Working',
                    value: store.workTime,
                    inc: store.isStarted && store.isWorking()
                        ? null
                        : store.incrementTimeWork,
                    dec: store.isStarted && store.isWorking()
                        ? null
                        : store.decrementTimeWork,
                  ),
                  EntryTime(
                      title: 'Resting',
                      value: store.restTime,
                      inc: store.isStarted && !store.isWorking()
                          ? null
                          : store.incrementRestTime,
                      dec: store.isStarted && !store.isWorking()
                          ? null
                          : store.decrementRestTime),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
