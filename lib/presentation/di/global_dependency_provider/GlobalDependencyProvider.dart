

import 'dart:collection';

import 'package:chucks_cards/data/jokes/JokesRepoImp.dart';
import 'package:chucks_cards/data/jokes/chucknorrisjokes/ChuckNorrisJokesManager.dart';
import 'package:chucks_cards/data/jokes/memorystorage/JokeMemoryStorageImp.dart';
import 'package:chucks_cards/domain/repositories/JokesRepo.dart';
import 'package:chucks_cards/domain/usecases/FetchNewJoke.dart';
import 'package:chucks_cards/domain/usecases/GetNewJoke.dart';
import 'package:chucks_cards/presentation/jokes_page/JokesPageBusinessHolder.dart';
import 'package:chucks_cards/presentation/splash/SplashBusinessHolder.dart';
import 'package:flutter/cupertino.dart';

class GlobalDependencyProvider {
  static JokesMemoryStorage _jokesStorage = new JokesMemoryStorageImp(Map(), Queue());


  static SplashBusinessHolder provideSplashBuisinessHolder(BuildContext context) {
    JokesApiManager _jokesManager = new ChuckNorrisJokesManager();
    JokesRepo jokesRepo = new JokesRepoImp(_jokesManager,_jokesStorage);
    FetchNewJokes fetchNewJokes = new FetchNewJokes(jokesRepo);
    return new SplashBusinessHolder(fetchNewJokes, context);
  }

  static JokesPageBusinessHolder provideJokesPageBusinessHolder() {
    JokesApiManager _jokesManager = new ChuckNorrisJokesManager();
    JokesRepo jokesRepo = new JokesRepoImp(_jokesManager,_jokesStorage);
    GetNewJoke _getNewJoke = new GetNewJoke(jokesRepo);
    return new JokesPageBusinessHolder(_getNewJoke);
  }
}