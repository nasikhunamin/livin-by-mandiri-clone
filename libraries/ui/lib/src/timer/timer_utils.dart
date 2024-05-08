class TimerUtils {
  Duration? _duration;

  TimerUtils(int totalSeconds) {
    _duration = Duration(seconds: totalSeconds);
  }

  int get hour {
    return _duration?.inHours ?? 0;
  }

  int get minutes {
    return _duration?.inMinutes.remainder(60) ?? 0;
  }

  int get seconds {
    return _duration?.inSeconds.remainder(60) ?? 0;
  }

  @override
  String toString() {
    var resultMinutes = minutes.toString().padLeft(2, '0');
    var resultSeconds = seconds.toString().padLeft(2, '0');
    return "$hour : $resultMinutes : $resultSeconds";
  }
}
