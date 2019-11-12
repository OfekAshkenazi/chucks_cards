import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/presentation/common/BaseBusinessHolder.dart';

class NewJokesLoadedAction extends UIAction {
  bool _handled = false;

  final List<Joke> _jokes;

  NewJokesLoadedAction( this._jokes);

  @override
  void handle(BaseUiActionHandler handler) {
    if (!_handled && handler is NewJokesLoadedActionHandler) {
      (handler as NewJokesLoadedActionHandler).onNewJokesLoaded(_jokes);
    }
  }
}

class NewJokesLoadedActionHandler {
  bool onNewJokesLoaded(List<Joke> jokes) {
    print("class:NewJokesLoadedActionHandler, function:onNewJokesLoaded - not yet immplemented");
    return false;
  }
}
