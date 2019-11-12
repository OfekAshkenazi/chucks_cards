import 'package:chucks_cards/domain/entities/Joke.dart';
import 'package:chucks_cards/presentation/common/BaseBusinessHolder.dart';
import 'package:chucks_cards/presentation/di/global_dependency_provider/GlobalDependencyProvider.dart';
import 'package:chucks_cards/presentation/jokes_page/JokesPageBusinessHolder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'actions/JokesPageActions.dart';

class JokesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new JokesPageState();
  }
}

class JokesPageState extends State<JokesPage>
    implements BaseUiActionHandler, NewJokesLoadedActionHandler {
  final List<Widget> _cards = new List<Widget>();
  JokesPageBusinessHolder jokesPageBusinessHolder;
  CardController controller;

  JokesPageState() {
    jokesPageBusinessHolder =
        GlobalDependencyProvider.provideJokesPageBusinessHolder();
    jokesPageBusinessHolder.actionsSubject
        .listen(((event) => {event.handle(this)}));
    jokesPageBusinessHolder.loadInitialJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes Cards'),
        centerTitle: true,
        actions: <Widget>[PopupMenuButton(
          itemBuilder: (BuildContext context) {

          },
        )],
      ),
      body: Container(
        alignment: Alignment.center,
        child: TinderSwapCard(
          cardBuilder: (context, index) => _cards[index],
          totalNum: _cards.length,
          stackNum: _cards.length,
          swipeEdge: 4.0,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 0.9,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.width * 0.8,
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            if (orientation == CardSwipeOrientation.RECOVER) {
              return;
            }
            if (_cards.length > 0) {
              _cards.removeAt(0);
            }
            jokesPageBusinessHolder.loadAnotherJoke();
          },
        ),
      ),
    );
  }

  @override
  bool onNewJokesLoaded(List<Joke> jokes) {
    setState(() {
      _cards.addAll(jokes.map(_buildCardFromJoke).toList());
    });
    return true;
  }

  Widget _buildCardFromJoke(Joke element) {
    return Container(
      width: 350,
      height: 350,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        child: Text(
          element.text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
