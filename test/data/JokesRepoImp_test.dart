import 'dart:async';

import 'package:chucks_cards/data/jokes/JokesRepoImp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '../MocksClasses.dart';

main() {
  test(
    "getJokes verify endless stream",
    () async {
      JokesApiManager jokesManager = new JokesApiManagerMock();
      JokesMemoryStorage jokesStorage = new JokesMemoryStorageMock();
      JokesRepoImp jokesRepoImp = new JokesRepoImp(jokesManager, jokesStorage);
      when(jokesStorage.getJoke(null)).thenAnswer((_) async => new JokeMock());
      return jokesRepoImp
          .getJokes(null)
          .take(30)
          .toList()
          .then((data) => {expect(data.length, 30)});
    },
  );
}
