import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer/timer/timer.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  static const int _duration = 10;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(TimerInitial(_duration)) {
    on<TimerStarted>(_onStarted);
    on<TimerTicked>(_onTicked);
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
  }

  // Cancel the subscription when the bloc is closed.
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
    emit(TimerRunning(event.duration));
    _tickerSubscription?.cancel(); //deallocating memory if there's already a subscription.
    _tickerSubscription = _ticker
        .tick(
          ticks: event.duration,
        )
        .listen(
          (duration) => add(
            TimerTicked(duration: duration),
          ),
        );
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0 ? TimerRunning(event.duration) : TimerRunningFinished(),
    );
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunning) {
      _tickerSubscription?.pause();
      emit(TimerRunningPaused(state.duration));
    }
  }

  void _onResumed(TimerResumed event, Emitter<TimerState> emit) {
    if (state is TimerRunningPaused) {
      _tickerSubscription?.resume();
      emit(TimerRunning(state.duration));
    }
  }
}
