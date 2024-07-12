abstract class AppEvent {
  const AppEvent();
}
// Immutable events
class IncrementEvent extends AppEvent {
  const IncrementEvent();
}
class DecrementEvent extends AppEvent {
  const DecrementEvent();
}
class ResetEvent extends AppEvent {
  const ResetEvent();
}
abstract class AckEvent {
  const AckEvent();
}
class IncrementAckEvent extends AckEvent {
  const IncrementAckEvent();
}
class DecrementAckEvent extends AckEvent {
  const DecrementAckEvent();
}
class ResetAckEvent extends AckEvent {
  const ResetAckEvent();
}