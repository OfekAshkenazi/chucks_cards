import 'dart:math';

import 'package:chucks_cards/presentation/common/BaseBusinessHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:chucks_cards/domain/usecases/FetchNewJoke.dart';

import 'actions/SplashActions.dart';
class SplashBusinessHolder extends BaseBusinessHolder {
  final FetchNewJokes _fetchNewJokes;
  final BuildContext _buildContext;
  SplashBusinessHolder(this._fetchNewJokes,this._buildContext);

  void preLoadJokes(){
      final subscription = _fetchNewJokes.fetchJokes(null)
          .take(4)
      .ignoreElements()
      .doOnDone(()=> _onDoneFetchingJokes())
          .listen((event)=>{},onError: (error)=>{print(error.toString())},cancelOnError: false);
      addSubscription(subscription);
  }

  _onDoneFetchingJokes() {
     UIAction event = DoneJokesFetchingAction(_buildContext);
     actionsSubject.add(event);
  }
}


