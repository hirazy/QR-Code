import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrcode_app/event/flash_event.dart';
import 'package:qrcode_app/states/flash_states.dart';

class FlashBloc extends Bloc<FlashEvent, bool>{
  FlashBloc(bool initialState) : super(initialState);

  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(FlashEvent event) async*{
    print(state);//this is "current state"
    //You must have UI to send Event(by pressing buttons)
    switch(event) {
      case FlashEvent.CLICK_FLASH:
        var newState = !state;
        yield newState;
        break;
    }
  }
}