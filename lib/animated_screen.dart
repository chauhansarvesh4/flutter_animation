import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_detail_screen.dart';
import 'package:flutter_animations/other/animated_list_sample.dart';

import 'constant.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(8.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: Constant.ANIMATED_LIST.map((e) {
          return OutlineButton(
            splashColor: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {

                return e== Constant.ANIMATED_LIST_STATE ? AnimatedListSample(e)  : AnimatedDetailScreen(e);
              }));
            },
            child: Center(
              child: Text(
                e,
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
