import 'dart:collection';
import 'package:chucks_cards/data/jokes/JokesRepoImp.dart';
import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:rxdart/rxdart.dart';

class JokesMemoryStorageImp implements JokesMemoryStorage {
  final Map<Category, Queue<Joke>> queuesMap;
  final Queue<Joke> randomQueue;

  JokesMemoryStorageImp(this.queuesMap, this.randomQueue);

  @override
  Future<Joke> getJoke(Category category) async {
    if (category != null) {
      return queuesMap[category].removeFirst();
    } else {
      if (randomQueue.isNotEmpty) {
        return randomQueue.removeFirst();
      } else {
        return Observable.fromIterable(queuesMap.values)
            .map((queue) => queue.removeFirst())
            .first;
      }
    }
  }

  @override
  Future<void> saveJoke(Joke joke, Category category) async {
    if(category == null) {
      randomQueue.add(joke);
    } else{
      queuesMap[category].add(joke);
    }
  }
}
