import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';

import '../event&stare/events.dart';
import '../event_bus.dart';


class CounterTextBloc {
  final EventBus _eventBus = eventBus;
  int _counter = 0;
  late StreamController<int> _counterController;
  CounterTextBloc() {
    _counterController = StreamController<int>.broadcast();
// Subscribe only to IncrementEvent, DecrementEvent, and ResetEvent
    _eventBus.on<IncrementEvent>().listen((event) {
      _counter++;
      _counterController.add(_counter);
      _eventBus.fire(const IncrementAckEvent());
    });
    _eventBus.on<DecrementEvent>().listen((event) {
      _counter--;
      _counterController.add(_counter);
      _eventBus.fire(const DecrementAckEvent());
    });
    _eventBus.on<ResetEvent>().listen((event) {
      _counter = 0;
      _counterController.add(_counter);
      _eventBus.fire(const ResetAckEvent());
    });
  }
  Stream<int> get counterStream => _counterController.stream;
  void dispose() {
    _counterController.close();
  }
}