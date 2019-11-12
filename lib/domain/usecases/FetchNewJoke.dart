import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/domain/repositories/JokesRepo.dart';
import 'package:rxdart/rxdart.dart';

class FetchNewJokes {
  final JokesRepo _jokesRepo;

  FetchNewJokes(this._jokesRepo);

  Future<void> fetchOneJoke(Category category) {
    return _jokesRepo.fetchNewJoke(category).first;
  }

  ///Fetching new joke repeatedly and saves them locally
  Observable<void> fetchJokes(Category category) {
    return _jokesRepo.fetchNewJoke(category);
  }
}
