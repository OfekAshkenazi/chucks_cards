import 'package:chucks_cards/data/jokes/JokesRepoImp.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/domain/repositories/JokesRepo.dart';
import 'package:mockito/mockito.dart';

class JokesRepoMock extends Mock implements JokesRepo {}
class JokesApiManagerMock extends Mock implements JokesApiManager {}
class JokesMemoryStorageMock extends Mock implements JokesMemoryStorage {}
class JokeMock extends Mock implements Joke {}

class MockedFun extends Mock implements Func {}
class MockedFun1<T> extends Mock implements Func1<T> {}

class Func {
  call() => {};
}
class Func1<T> {
  call(T object) => {};
}