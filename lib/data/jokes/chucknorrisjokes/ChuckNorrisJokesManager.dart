import 'dart:async';
import 'dart:convert';
import 'package:chucks_cards/domain/entities/Category.dart';
import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/data/jokes/JokesRepoImp.dart';
import 'package:http/http.dart' as http;
import 'package:chucks_cards/data/jokes/chucknorrisjokes/entities/ChuckNorrisDTO.dart';

// responsible for fetching jokes from https://api.chucknorris.io/
class ChuckNorrisJokesManager implements JokesApiManager {
  static final String CHUCK_NORRIS_IO_BASE_URL =
      'api.chucknorris.io';
  static final String RANDOM_ENDPOINT = '/jokes/random';
  static final String CATEGORY_QUERY_KEY = "";

  @override
  Future<Joke> fetchRandomJoke() async {
    var response =
        await http.get(Uri.http(CHUCK_NORRIS_IO_BASE_URL, RANDOM_ENDPOINT));
    print(response);
    return mapChuckNorrisJokeDtoToJoke(
        ChuckNorrisJokeDTO.fromJson(jsonDecode(response.body)));
  }

  @override
  Future<Joke> fetchJokeFromCategory(Category category) async {
    var queryParams = Map<String, String>();
    queryParams.putIfAbsent(
        CATEGORY_QUERY_KEY, () => getCategoryQueryParam(category));
    var response = await http
        .get(Uri.https(CHUCK_NORRIS_IO_BASE_URL, RANDOM_ENDPOINT, queryParams));
    return mapChuckNorrisJokeDtoToJoke(
        ChuckNorrisJokeDTO.fromJson(jsonDecode(response.body)));
  }
}

class Categories {
  static const String ANIMAL_PARAM_VAL = "animal";

  static const String CAREER_PARAM_VAL = "career";

  static const String FOOD_PARAM_VAL = "food";

  static const String CELEBRITY_PARAM_VAL = "celebrity";

  static const String DEV_PARAM_VAL = "dev";

  static const String EXPLICIT_PARAM_VAL = "explicit";

  static const String FASHION_PARAM_VAL = "fashion";

  static const String HISTORY_PARAM_VAL = "history";

  static const String MONEY_PARAM_VAL = "money";

  static const String MOVIE_PARAM_VAL = "movie";

  static const String MUSIC_PARAM_VAL = "music";

  static const String POLITICAL_PARAM_VAL = "political";

  static const String RELIGION_PARAM_VAL = "religion";

  static const String SCIENCE_PARAM_VAL = "science";

  static const String SPORT_PARAM_VAL = "sport";

  static const String TRAVEL_PARAM_VAL = "travel";
}

String getCategoryQueryParam(Category category) {
  switch (category) {
    case Category.animal:
      return Categories.ANIMAL_PARAM_VAL;
    case Category.career:
      return Categories.CAREER_PARAM_VAL;
    case Category.celebrity:
      return Categories.CELEBRITY_PARAM_VAL;
    case Category.dev:
      return Categories.DEV_PARAM_VAL;
    case Category.explicit:
      return Categories.EXPLICIT_PARAM_VAL;
    case Category.fashion:
      return Categories.FASHION_PARAM_VAL;
    case Category.food:
      return Categories.FOOD_PARAM_VAL;
    case Category.history:
      return Categories.HISTORY_PARAM_VAL;
    case Category.money:
      return Categories.MONEY_PARAM_VAL;
    case Category.movie:
      return Categories.MOVIE_PARAM_VAL;
    case Category.music:
      return Categories.MUSIC_PARAM_VAL;
    case Category.political:
      return Categories.POLITICAL_PARAM_VAL;
    case Category.religion:
      return Categories.RELIGION_PARAM_VAL;
    case Category.science:
      return Categories.SCIENCE_PARAM_VAL;
    case Category.sport:
      return Categories.SPORT_PARAM_VAL;
    case Category.travel:
      return Categories.TRAVEL_PARAM_VAL;
  }
}

Joke mapChuckNorrisJokeDtoToJoke(ChuckNorrisJokeDTO chuckNorrisJokeDTO) {
  Joke joke = Joke(chuckNorrisJokeDTO.iconUrl, chuckNorrisJokeDTO.url,
      chuckNorrisJokeDTO.value, chuckNorrisJokeDTO.id);
  return joke;
}
