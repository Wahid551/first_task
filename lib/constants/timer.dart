import 'dart:async';
import 'package:flutter/material.dart';

class PeriodicTimerProvider with ChangeNotifier {
  Duration duration = Duration();
  Timer? timer;
  static const countdownDuration = Duration(minutes: 10);
  bool isCountdown = true;
  void timerIncreament({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        // Update user about remaining time
        addTime();
      },
    );
  }

  void addTime() {
    final addSeconds = 1;

    final seconds = duration.inSeconds + addSeconds;
    duration = Duration(seconds: seconds);
    notifyListeners();
  }

  void reset() {
    if (isCountdown) {
      duration = countdownDuration;
      notifyListeners();
    } else {
      duration = Duration();
      notifyListeners();
    }
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }

    timer!.cancel();
    notifyListeners();
  }
}
