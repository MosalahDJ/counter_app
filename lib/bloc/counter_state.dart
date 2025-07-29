part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  @override
  List<Object> get props => [counter];
}

class InitialState extends CounterState {
  const InitialState(super.counter);
}

final class IncrementState extends CounterState {
  const IncrementState(super.counter);
}

final class DecrementState extends CounterState {
  const DecrementState(super.counter);
}

final class RsetState extends CounterState {
  const RsetState(super.counter);
}
