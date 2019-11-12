import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:rxdart/rxdart.dart';

class JokesRepo {
    Observable<void> fetchNewJoke([Category category]){
        print("fetchNewJoke not implemented");
        return null;
    }

    Observable<Joke> getJokes(Category category) {
    print("getJoke not implemented");
    return null;
  }
}