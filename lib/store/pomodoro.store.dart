import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum RangeType {
  rest,
  work,
}

abstract class _PomodoroStore with Store {
  @observable
  bool isStarted = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  RangeType rangeType = RangeType.rest;

  Timer? stopwatch;

  @action
  void start() {
    isStarted = true;
    stopwatch = Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        if (minutes == 0 && seconds == 0) {
          changeRangeType();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      },
    );
  }

  @action
  void stop() {
    isStarted = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    isStarted = false;
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incrementTimeWork() {
    workTime++;
    if (isWorking()) restart();
  }

  @action
  void decrementTimeWork() {
    if (workTime > 1) workTime--;
    if (isWorking()) restart();
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (!isWorking()) restart();
  }

  @action
  void decrementRestTime() {
    if (restTime > 1) restTime--;
    if (!isWorking()) restart();
  }

  bool isWorking() => rangeType == RangeType.work;

  @action
  void changeRangeType() {
    if (isWorking()) {
      rangeType = RangeType.rest;
      minutes = restTime;
    } else {
      rangeType = RangeType.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
