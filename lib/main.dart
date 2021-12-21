import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:timer/app.dart';
import 'package:timer/observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: Observer(),
  );
}
