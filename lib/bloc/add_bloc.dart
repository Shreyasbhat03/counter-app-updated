import 'dart:async';
import 'package:event_bus/event_bus.dart';
import '../event&stare/events.dart';
import '../event_bus.dart';
class IncrementButtonBloc {
  final EventBus _eventBus = eventBus;
  late StreamSubscription _incrementAckSubscription;
  IncrementButtonBloc() {
    _incrementAckSubscription =
        _eventBus.on<IncrementAckEvent>().listen((event) {
          print('Received Increment Acknowledgment');
        });
  }
  void increment() {
    _eventBus.fire(const IncrementEvent());
  }
  void dispose() {
    _incrementAckSubscription.cancel();
  }
}