class CounterState {
  int counter;
  CounterState({required this.counter});
}

class CounterIncrement extends CounterState {
  CounterIncrement({required super.counter});
}

class CounterReststate extends CounterState {
  CounterReststate({required super.counter});
}

class CounterDecrement extends CounterState {
  CounterDecrement({required super.counter});
}
