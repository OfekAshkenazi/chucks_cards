import 'package:chucks_cards/presentation/jokes_page/JokesPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:chucks_cards/presentation/di/global_dependency_provider/GlobalDependencyProvider.dart';
import 'SplashBusinessHolder.dart';
import 'actions/SplashActions.dart';

class SplashScreen extends StatelessWidget implements DoneJokesFetchingActionHandler{
  @override
  Widget build(BuildContext context) {
    SplashBusinessHolder _businessHolder = GlobalDependencyProvider.provideSplashBuisinessHolder(context);
    _businessHolder.actionsSubject.listen(
      (action) => {action.handle(this)},);
    _businessHolder.preLoadJokes();
    return Scaffold(
      appBar: null,
      body: Column(
        children: <Widget>[
          Text(
            "Chuck Norris's Cards",
            style: TextStyle(fontSize: 18.0),
          ),
          Image.asset("assets/imageassets/chuck_norris.png"),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  @override
  bool onDoneFetching(BuildContext context) {
    if(context == null) {
      return false;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => JokesPage()),);
    return true;
  }
}



class FadingImageHolder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FadingImageState();
  }
}

class FadingImageState extends State<FadingImageHolder>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 3000),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Image.asset("assets/imageassets/chuck_norris.png"),
    );
  }
}
