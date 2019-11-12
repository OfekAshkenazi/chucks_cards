import 'dart:async';

import 'package:rxdart/rxdart.dart';

abstract class BaseBusinessHolder {
  final PublishSubject<UIAction> actionsSubject =
      new PublishSubject<UIAction>();
  final List<StreamSubscription> _subscriptionsCollector =
      new List<StreamSubscription>();

  void addSubscription(StreamSubscription streamSubscription) {
    streamSubscription
        .onDone(() => {_subscriptionsCollector.remove(streamSubscription)});
    _subscriptionsCollector.add(streamSubscription);
  }

  void clearResources() {
    actionsSubject.close();
  }
}

abstract class UIAction {
  void handle(BaseUiActionHandler handler);
}

class BaseUiActionHandler {}
