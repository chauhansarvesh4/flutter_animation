import 'package:flutter/material.dart';
import 'package:flutter_animations/constant.dart';
import 'dart:math' as math;

import 'package:flutter_animations/syntax_screen.dart';

class AnimatedDetailScreen extends StatefulWidget {
  final String animatedType;

  AnimatedDetailScreen(this.animatedType);

  @override
  _AnimatedDetailScreenState createState() => _AnimatedDetailScreenState();
}

class _AnimatedDetailScreenState extends State<AnimatedDetailScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  bool selected = false, _first = true;
  double opacityLevel = 1.0;
  Color _color = Colors.blue;
  double _size = 30;
  double _left = 20;
  double _top = 20;
  double _right = 20;
  double _bottom = 20;
  double _width = 200;
  double _height = 200;
  int _count = 0;

  AlignmentGeometry _alignment = Alignment.topRight;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.animatedType),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return SyntaxScreen(widget.animatedType);
            }));
          },icon: Icon(Icons.code),),
        ],
      ),
      body: Center(
        child: _filterAnimated(),
      ),
    );
  }

  _filterAnimated() {
    switch (widget.animatedType) {
      case Constant.ANIMATED_BUILDER:
        return AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
            child: const Center(
              child: Text('fLuTtEr'),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        );
      case Constant.ANIMATED_CONTAINER:
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Center(
            child: AnimatedContainer(
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.red : Colors.blue,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: FlutterLogo(size: 75),
            ),
          ),
        );
      case Constant.ANIMATED_CROSSFADE:
        return InkWell(
          onTap: () {
            _first = !_first;
            setState(() {});
          },
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 3),
            firstChild: const FlutterLogo(
                style: FlutterLogoStyle.horizontal, size: 100.0),
            secondChild:
                const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState:
                _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        );
      case Constant.ANIMATED_DEFAULT_TEXTSTYLE:
        return InkWell(
          onTap: () {
            if (_size == 50) {
              _size = 30;
              _color = Colors.red;
            } else {
              _size = 50;
              _color = Colors.green;
            }
            setState(() {});
          },
          child: AnimatedDefaultTextStyle(
            duration: Duration(seconds: 1),
            style: TextStyle(
              color: _color,
              fontSize: _size,
            ),
            child: Text("Hello Flutter"),
          ),
        );
      case Constant.ANIMATED_ALIGN:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: AnimatedAlign(
                alignment: _alignment,
                curve: Curves.ease,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _changeAlignment();
              },
              child: Text(
                "Click Me!",
              ),
            )
          ],
        );
      case Constant.ANIMATED_OPACITY:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 3),
                child: FlutterLogo(
                  size: 200,
                ),
              ),
              RaisedButton(
                child: Text('Fade Logo'),
                onPressed: _changeOpacity,
              ),
            ],
          ),
        );
      case Constant.ANIMATED_PHYSICAL_MODEL:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: const Text('Click Me!'),
              onPressed: () {
                setState(() {
                  _first = !_first;
                });
              },
            ),
          ],
        );
      case Constant.ANIMATED_POSITION:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    left: _left,
                    top: _top,
                    right: _right,
                    bottom: _bottom,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: const Text('CLICK ME!'),
              onPressed: () {
                setState(() {
                  _left = _first ? 10 : 20;
                  _top = _first ? 70 : 20;
                  _right = _first ? 10 : 20;
                  _bottom = _first ? 70 : 20;

                  _first = !_first;
                });
              },
            ),
          ],
        );
      case Constant.ANIMATED_SIZE:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              child: Center(
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: _width,
                    height: _height,
                    color: Colors.blue,
                  ),
                  vsync: this,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: const Text('CLICK ME!'),
              onPressed: () {
                setState(() {
                  _width = _first ? 220 : 200;
                  _height = _first ? 160 : 200;

                  _first = !_first;
                });
              },
            ),
          ],
        );
      case Constant.ANIMATED_WIDGET:
        return SpinningContainer(controller: _controller);
      case Constant.ANIMATED_SWITCHER:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        );
    }
  }

}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller})
      : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(width: 200.0, height: 200.0, color: Colors.green),
    );
  }
}
