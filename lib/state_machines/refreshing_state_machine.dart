import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';
import '../states/refreshing_state.dart';
import '../events/event.dart';
import '../events/refresh_events.dart';
import '../interfaces/trans_methods.dart';

class RefreshingStateMachine extends BasicStateMachine {

  RefreshingStateMachine(super.currentState);

  @override
  void create() {
    states_ [state_(RefreshingStates.refreshing)]   = State([ Trans(Refresh(),  state_(RefreshingStates.refreshing),  OnNothing())]);
  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    return "state [${RefreshingStates.values[state].name}]";
  }

  @override
  void publishEvent(Event event) {
    print ("publishEvent->${event}");
  }

  @override
  void publishState(int state) {
    // TODO: implement publishState
  }

}
