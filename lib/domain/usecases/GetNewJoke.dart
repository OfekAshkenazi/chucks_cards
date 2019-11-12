import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/domain/repositories/JokesRepo.dart';
import 'package:rxdart/rxdart.dart';
class GetNewJoke {
  final JokesRepo jokesRepo;

  GetNewJoke(this.jokesRepo);

  Future<Joke> getNewJoke(Category category) {
    return jokesRepo.getJokes(category).first;
  }

  Observable<Joke> getNewJokes(Category category) {
    return jokesRepo.getJokes(category);
  }
}
