import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:event_bus/event_bus.dart';

import '../event&stare/events.dart';
import '../event_bus.dart';


class ResetButtonBloc {
final EventBus _eventBus = eventBus;
late StreamSubscription _resetAckSubscription;
ResetButtonBloc() {
  _resetAckSubscription = _eventBus.on<ResetAckEvent>().listen((event) {
// Handle reset acknowledgment
// Example: Display a snackbar or perform any UI update
    print('Received Reset Acknowledgment');
  });
}
void reset() {
  _eventBus.fire(const ResetEvent());
}
void dispose() {
  _resetAckSubscription.cancel();
}
}