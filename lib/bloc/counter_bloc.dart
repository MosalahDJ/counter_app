import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super((InitialState(0))) {
    on<IncrementEvent>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });
    on<DecrementEvent>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
    on<ResetEvent>((event, emit) {
      emit(RsetState(0));
    });
  }
}

//so
