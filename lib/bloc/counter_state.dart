part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState(this.counter);
  final int counter;
  @override
  List<Object> get props => [counter];
}

final class CounterInitial extends CounterState {
  const CounterInitial(super.counter);

}
