
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_screen.dart';
import 'package:flutter_animations/explicit_screen.dart';
import 'package:flutter_animations/transition_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicator:  BubbleTabIndicator(
            indicatorHeight: 32.0,
            indicatorColor: Colors.white54,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ), tabs: <Widget>[
            Tab(child: Text('TRANSITION'),),
            Tab(child: Text('ANIMATED'),),
            Tab(child: Text('EXPLICIT'),),
        ],
        ),
      ),
      body: TabBarView(children: <Widget>[
        TransitionScreen(),
        AnimatedScreen(),
        ExplicitScreen()
      ],),
    ),);
  }
}
