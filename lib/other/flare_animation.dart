import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../syntax_screen.dart';

class FlareAnimation extends StatefulWidget {
  @override
  _FlareAnimationState createState() => _FlareAnimationState();
}

class _FlareAnimationState extends State<FlareAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flare/Rive animation'),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return SyntaxScreen('RIVE_ANIMATION');
            }));
          },icon: Icon(Icons.code),),
        ],
      ),
      body: Center(
          child: FlareActor("assets/rive/meteor.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Idle")),
    );
  }
}
