import 'package:chucks_cards/domain/usecases/FetchNewJoke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import '../MocksClasses.dart';



main() {
  test("verifing only one joke is fetched even when 2 fetches are queued", () {
    var mock = new JokesRepoMock();
    void Function() listener = new MockedFun();
    var firstObservable = Observable.just(new Object()).doOnDone(listener);
    var secondObservable = Observable.just(new Object()).doOnDone(listener);
    when(mock.fetchNewJoke(null)).thenAnswer(((_) => Observable.concat([firstObservable, secondObservable])));
    FetchNewJokes fetchNewJokes = new FetchNewJokes(mock);
    return fetchNewJokes
        .fetchOneJoke(null)
    .whenComplete(()=> verify(listener.call()).called(1))
        .then((val) => {},onError: (error)=> print(error));
  });
  test("verify multiple item fetched ", () {
    var mock = new JokesRepoMock();
    void Function(Object notification) listener = new MockedFun1();
    var firstObservable = Observable.just(new Object()).doOnData(listener);
    var secondObservable = Observable.just(new Object()).doOnData(listener);
    when(mock.fetchNewJoke(null)).thenAnswer(((_) => Observable.concat([firstObservable, secondObservable])));
    FetchNewJokes fetchNewJokes = new FetchNewJokes(mock);
    return fetchNewJokes
        .fetchJokes(null)
        .listen((val) => {},onError: (error)=> print(error),onDone: ()=> verify(listener.call(any)).called(2));
  });

}


