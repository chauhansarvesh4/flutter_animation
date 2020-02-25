import 'package:flutter/material.dart';
import 'package:flutter_animations/syntax_screen.dart';

import 'constant.dart';

class TransitionDetailScreen extends StatefulWidget {
  final String transitionName;

  TransitionDetailScreen(this.transitionName);

  @override
  _TransitionDetailScreenState createState() => _TransitionDetailScreenState();
}

class _TransitionDetailScreenState extends State<TransitionDetailScreen>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transitionName),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return SyntaxScreen(widget.transitionName);
            }));
          },icon: Icon(Icons.code),),
          IconButton(
            onPressed: () {
              _controller.isCompleted
                  ? _controller.reverse()
                  : _controller.forward();
            },
            icon: Icon(Icons.flash_on),
          )
        ],
      ),
      body: widget.transitionName == Constant.TRANSITION_POSITIOIN
          ? _filterTransitionAnimation()
          : Container(
              width: size.width,
              height: size.height,
              alignment: Alignment.center,
              child: _filterTransitionAnimation()),
    );
  }

  _filterTransitionAnimation() {
    switch (widget.transitionName) {
      case Constant.TRANSITION_SIZE:
        return SizedBox(
            height: 200,
            child: SizeTransition(
                sizeFactor: _animation,
                child: FlutterLogo(
                  size: 200,
                ),
                axis: Axis.horizontal));
      case Constant.TRANSITION_FADE:
        return FadeTransition(
            opacity: _animation,
            child: FlutterLogo(
              size: 200,
            ));
      case Constant.TRANSITION_ALIGN:
        _animation = Tween<AlignmentGeometry>(
                begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        return AlignTransition(
          alignment: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        );

      case Constant.TRANSITION_SCALE:
        return ScaleTransition(
          scale: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        );
      case Constant.TRANSITION_ROTATE:
        return RotationTransition(
          turns: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        );
      case Constant.TRANSITION_POSITIOIN:
        final RelativeRectTween relativeRectTween = RelativeRectTween(
          begin: RelativeRect.fromLTRB(60, 60, 60, 60),
          end: RelativeRect.fromLTRB(0, 0, 0, 0),
        );
        _animation = relativeRectTween.animate(
            CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
        return Container(
          height: 300,
          child: Stack(
            children: <Widget>[
              PositionedTransition(
                rect: _animation,
                child: Container(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(20),
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ],
          ),
        );
      case Constant.TRANSITION_SLIDE:
        /* begin: Offset.zero,
      end: const Offset(1.5, 0.0),*/

        _animation = Tween<Offset>(
                begin: Offset.zero, end: const Offset(1.5, 0.0))
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
        return SlideTransition(
          position: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        );
        break;
      case Constant.TRANSITION_DECORATED_BOX:
        final DecorationTween decorationTween = DecorationTween(
          begin: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            border: Border.all(
              color: const Color(0xFF000000),
              style: BorderStyle.solid,
              width: 4.0,
            ),
            borderRadius: BorderRadius.zero,
            shape: BoxShape.rectangle,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x66000000),
                blurRadius: 10.0,
                spreadRadius: 4.0,
              )
            ],
          ),
          end: BoxDecoration(
            color: const Color(0xFF000000),
            border: Border.all(
              color: const Color(0xFF202020),
              style: BorderStyle.solid,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            shape: BoxShape.rectangle,
            // No shadow.
          ),
        );

        _animation = decorationTween.animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear));
        return DecoratedBoxTransition(
          decoration: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        );
        break;
      case Constant.TRANSITION_DEFAULT_TEXT_STYLE:
        _animation = Tween<TextStyle>(
                begin: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                end: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Colors.green))
            .animate(CurvedAnimation(
                parent: _controller, curve: Curves.elasticInOut));
        return DefaultTextStyleTransition(
          style: _animation,
          child: Text("Flutter"),
        );
        break;
      case Constant.TRANSITION_RELATIVE_POSTIOIN:
        final RectTween rectTween = RectTween(
          begin: Rect.fromLTRB(30, 30, 0, 0),
          end: Rect.fromLTRB(0, 0, 20, 20),
        );
        _animation = rectTween.animate(
            CurvedAnimation(parent: _controller, curve: Curves.linear));
        return Stack(
          children: <Widget>[
            RelativePositionedTransition(
              rect: _animation,
              size: Size(200, 200),
              child: FlutterLogo(
                size: 200,
              ),
            ),
          ],
        );
        break;
      default:
        return FlutterLogo();
    }
  }
}
