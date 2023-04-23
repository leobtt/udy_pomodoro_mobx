import 'package:flutter/material.dart';
import 'package:udy_promodoro_mobx/components/stopwatch_button.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hora de Trabalhar',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '25:00',
              style: TextStyle(
                fontSize: 120,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: StopwatchButton(text: 'Start', icon: Icons.play_arrow),
                ),
                // Padding(
                //   padding: EdgeInsets.only(right: 10),
                //   child: StopwatchButton(text: 'Stop', icon: Icons.stop),
                // ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:
                        StopwatchButton(text: 'Restart', icon: Icons.refresh)),
              ],
            )
          ],
        ));
  }
}
