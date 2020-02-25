import 'package:flutter/material.dart';
import 'package:flutter_animations/other/drawer_animation.dart';

import 'other/flare_animation.dart';
import 'other/hero_animation.dart';

class ExplicitScreen extends StatefulWidget {
  @override
  _ExplicitScreenState createState() => _ExplicitScreenState();
}

class _ExplicitScreenState extends State<ExplicitScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ListView(
          children: <Widget>[
            Banner(
              message: "New",
              location: BannerLocation.topEnd,
              color: Colors.orange,
              child: Card(
                //margin: const EdgeInsets.all(0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DrawerAnimation();
                    }));
                  },
                  leading: Icon(Icons.menu),
                  title: Text('DRAWER'),
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return FlareAnimation();
                  }));
                },
                leading: Icon(Icons.filter_center_focus),
                title: Text('RIVE'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return HeroScreen();
                  }));
                },
                leading: Icon(Icons.add_to_home_screen),
                title: Text('HERO'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
