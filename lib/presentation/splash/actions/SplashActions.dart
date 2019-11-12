import 'package:chucks_cards/presentation/common/BaseBusinessHolder.dart';
import 'package:flutter/cupertino.dart';


class DoneJokesFetchingAction extends UIAction {
  bool _handled = false;
  final BuildContext buildContext;

  DoneJokesFetchingAction(this.buildContext);

  @override
  void handle(BaseUiActionHandler handler) {
    if (!_handled && handler is DoneJokesFetchingActionHandler) {
      _handled = handler.onDoneFetching(buildContext);
    }
  }
}


class DoneJokesFetchingActionHandler extends BaseUiActionHandler{
  bool onDoneFetching(BuildContext buildContext){
    print("DoneJokesFetchingActionHandler not implemented");
    return false;
  }
}