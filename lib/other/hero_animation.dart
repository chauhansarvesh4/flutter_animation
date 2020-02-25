import 'package:flutter/material.dart';

import '../syntax_screen.dart';

class HeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return SyntaxScreen('HERO_ANIMATION');
            }));
          },icon: Icon(Icons.code),),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Hero(
                tag: 'imageHero',
                child: Card(
                  child: FlutterLogo(
                    size: 100,
                  ),
                )),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen('imageHero');
              }));
            },
          ),
          GestureDetector(
            child: Hero(
                tag: 'imageHero2',
                child: Card(
                  child: FlutterLogo(
                    size: 100,
                  ),
                )),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen('imageHero2');
              }));
            },
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final tag;
  DetailScreen(this.tag);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Hero(
                tag: tag,
                child: SizedBox(
                  width: size.width,

                  child: Card(
                    child: FlutterLogo(
                      size: 200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
