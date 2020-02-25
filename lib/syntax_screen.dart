import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

import 'constant.dart';

class SyntaxScreen extends StatefulWidget {
  final String title;

  SyntaxScreen(this.title);

  @override
  _SyntaxScreenState createState() => _SyntaxScreenState();
}

class _SyntaxScreenState extends State<SyntaxScreen> {
  String _code = '';
  bool _dark;

  @override
  void initState() {
    super.initState();
    _dark = false;
    _getSyntax();
  }

  void _getSyntax() {
    String assetsPath = '';
    switch (widget.title) {
      case Constant.TRANSITION_SIZE:
        assetsPath = 'assets/size_transition.txt';
        break;
      case Constant.TRANSITION_FADE:
        assetsPath = 'assets/fade_transition.txt';
        break;
      case Constant.TRANSITION_ALIGN:
        assetsPath = 'assets/align_transition.txt';
        break;
      case Constant.TRANSITION_SCALE:
        assetsPath = 'assets/scale_transition.txt';
        break;
      case Constant.TRANSITION_ROTATE:
        assetsPath = 'assets/rotate_transition.txt';
        break;
      case Constant.TRANSITION_POSITIOIN:
        assetsPath = 'assets/position_transition.txt';
        break;
      case Constant.TRANSITION_SLIDE:
        assetsPath = 'assets/slide_transition.txt';
        break;
      case Constant.TRANSITION_DECORATED_BOX:
        assetsPath = 'assets/decorated_box_transition.txt';
        break;
      case Constant.TRANSITION_DEFAULT_TEXT_STYLE:
        assetsPath = 'assets/default_textstyle_transition.txt';
        break;
      case Constant.TRANSITION_RELATIVE_POSTIOIN:
        assetsPath = 'assets/relative_position_transition.txt';
        break;
      case Constant.ANIMATED_BUILDER:
        assetsPath = 'assets/animated/animated_builder.txt';
        break;
      case Constant.ANIMATED_LIST_STATE:
        assetsPath = 'assets/animated/animated_liststate.txt';
        break;
      case Constant.ANIMATED_CONTAINER:
        assetsPath = 'assets/animated/animated_container.txt';
        break;
      case Constant.ANIMATED_CROSSFADE:
        assetsPath = 'assets/animated/animated_crossfade.txt';
        break;
      case Constant.ANIMATED_DEFAULT_TEXTSTYLE:
        assetsPath = 'assets/animated/animated_default_textstyle.txt';
        break;
      case Constant.ANIMATED_ALIGN:
        assetsPath = 'assets/animated/animated_align.txt';
        break;
      case Constant.ANIMATED_OPACITY:
        assetsPath = 'assets/animated/animated_opacity.txt';
        break;
      case Constant.ANIMATED_PHYSICAL_MODEL:
        assetsPath = 'assets/animated/animated_physical_model.txt';
        break;
      case Constant.ANIMATED_POSITION:
        assetsPath = 'assets/animated/animated_position.txt';
        break;
      case Constant.ANIMATED_SIZE:
        assetsPath = 'assets/animated/animated_size.txt';
        break;
      case Constant.ANIMATED_WIDGET:
        assetsPath = 'assets/animated/animated_widget.txt';
        break;
      case Constant.ANIMATED_SWITCHER:
        assetsPath = 'assets/animated/animated_switcher.txt';
        break;
      case 'RIVE_ANIMATION':
        assetsPath = 'assets/rive/rive_animation.txt';
        break;
      case 'DRAWER_ANIMATION':
        assetsPath = 'assets/expicit/drawer_animation.txt';
        break;
      case 'HERO_ANIMATION':
        assetsPath = 'assets/expicit/hero_animation.txt';
        break;
      default:
        assetsPath = 'assets/size_transition.txt';
    }
    DefaultAssetBundle.of(context)
        .loadString(assetsPath)
        .then((codeText) => setState(() => _code = codeText));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
            activeColor: Colors.black,
            onChanged: (bool value) {
              _dark = value;
              setState(() {});
            },
            value: _dark,
          )
        ],
      ),
      body: SyntaxView(
        code: _code,
        syntax: Syntax.DART,
        syntaxTheme: _dark ? SyntaxTheme.dracula() : SyntaxTheme.gravityLight(),
        withZoom: true,
        withLinesCount: true,
      ),
    );
  }
}
