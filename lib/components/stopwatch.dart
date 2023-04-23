import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:udy_promodoro_mobx/components/stopwatch_button.dart';
import 'package:udy_promodoro_mobx/store/pomodoro.store.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PomodoroStore store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Container(
          color: store.isWorking() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.isWorking() ? 'Time to work' : 'Time to rest',
                style: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!store.isStarted)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopwatchButton(
                        text: 'Start',
                        icon: Icons.play_arrow,
                        click: store.start,
                      ),
                    ),
                  if (store.isStarted)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: StopwatchButton(
                        text: 'Stop',
                        icon: Icons.stop,
                        click: store.stop,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: StopwatchButton(
                      text: 'Restart',
                      icon: Icons.refresh,
                      click: store.restart,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
