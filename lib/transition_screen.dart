import 'package:flutter/material.dart';
import 'package:flutter_animations/constant.dart';
import 'package:flutter_animations/transition_detail_screen.dart';

class TransitionScreen extends StatefulWidget {
  @override
  _TransitionScreenState createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: EdgeInsets.all(8.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: Constant.TRANSITION_LIST.map((e) {
          return OutlineButton(
            splashColor: Colors.green,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return TransitionDetailScreen(e);
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
