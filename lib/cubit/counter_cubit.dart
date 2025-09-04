import 'package:counter_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  incrementcounter() {
    emit(CounterIncrement(counter: state.counter + 1));
  }

  resetcounter() {
    emit(CounterReststate(counter: state.counter = 0));
  }

  decrementcounter() {
    emit(CounterDecrement(counter: state.counter - 1));
  }
}
