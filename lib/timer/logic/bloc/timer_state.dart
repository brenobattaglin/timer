part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

class TimerRunning extends TimerState {
  const TimerRunning(int duration) : super(duration);

  @override
  String toString() => 'TimerRunning { duration: $duration }';
}

class TimerRunningPaused extends TimerState {
  const TimerRunningPaused(int duration) : super(duration);

  @override
  String toString() => 'TimerRunningPaused { duration: $duration }';
}

class TimerRunningFinished extends TimerState {
  const TimerRunningFinished() : super(0);

  @override
  String toString() => 'TimerRunningFinished { duration: $duration }';
}
