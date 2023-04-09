import "events/refresh_events.dart";
import "events/event.dart";
import "state_machines/basic_state_machine.dart";
import "state_machines/refreshing_state_machine.dart";
import "states/refreshing_state.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshingBloc extends Bloc<Event, RefreshingState> {
  BasicStateMachine? _stateMachine;

  RefreshingBloc(RefreshingState state) : super(state) {
    _stateMachine = RefreshingStateMachine(state_(RefreshingStates.refreshing));

    on<Refresh>((event, emit) {
      done(event, emit);
    });
  }

  void done(Event event, Emitter<RefreshingState> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      RefreshingState nextState = RefreshingState(RefreshingStates.values[newState]);
      nextState.setData(event.getData());
      emit(nextState);
    }
  }
}
