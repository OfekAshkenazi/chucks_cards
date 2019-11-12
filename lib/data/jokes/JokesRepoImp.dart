import 'package:rxdart/rxdart.dart';
import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/domain/repositories/JokesRepo.dart';

class JokesRepoImp implements JokesRepo {
  final JokesApiManager _jokesManager;
  final JokesMemoryStorage _jokesStorage;

  JokesRepoImp(this._jokesManager, this._jokesStorage);

  @override
  Observable<Joke> getJokes([Category category]) {
    return Observable<Joke>.repeat(
            (index) => Observable.fromFuture(_jokesStorage.getJoke(category)))
        // if there's no available jokes in the memory a joke should be loaded from the api
        .onErrorResume((error) => category == null
            ? Observable.fromFuture(_jokesManager.fetchRandomJoke())
            : Observable.fromFuture(
                _jokesManager.fetchJokeFromCategory(category)));
  }

  @override
  Observable<void> fetchNewJoke([Category category]) {
    var stream;
    if (category == null) {
      stream = Observable.repeat(
          (index) => Stream.fromFuture(_jokesManager.fetchRandomJoke()));
    } else {
      stream = Observable.repeat((index) =>
          Stream.fromFuture(_jokesManager.fetchJokeFromCategory(category)));
    }
    return stream.flatMap((joke) =>
        Observable.fromFuture(_jokesStorage.saveJoke(joke, category)));
  }
}

class JokesApiManager {
  Future<Joke> fetchRandomJoke() async {
    print("jokes manager not implemented");
    return null;
  }

  Future<Joke> fetchJokeFromCategory(Category category) async {
    print("jokes manager not implemented");
    return null;
  }
}

class JokesMemoryStorage {
  Future<Joke> getJoke(Category category) async {
    print("jokes memory storage not yet implemented");
    return null;
  }

  Future<void> saveJoke(Joke joke, Category category) async {
    print("jokes memory storage not yet implemented");
  }
}
