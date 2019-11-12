
import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/usecases/GetNewJoke.dart';
import 'package:chucks_cards/presentation/common/BaseBusinessHolder.dart';
import 'package:chucks_cards/presentation/jokes_page/actions/JokesPageActions.dart';

class JokesPageBusinessHolder extends BaseBusinessHolder {

  final GetNewJoke _getNewJoke;

  JokesPageBusinessHolder(this._getNewJoke);

  void _fetchJokes(Category category,int count){
    _getNewJoke.getNewJokes(category).take(count).toList().then((jokes) => {
        actionsSubject.add(new NewJokesLoadedAction(jokes))
    },onError: (error) => {
      print(error)
    });
  }

  void loadInitialJokes() {
    _fetchJokes(null, 4);
  }

  void loadAnotherJoke() {
    _fetchJokes(null, 1);
  }

}