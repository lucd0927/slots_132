import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PBFloating {

  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;


  void show({required BuildContext context, required Widget child}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return AnimatedScrollFloatingWidget(child: child);
      },
    );
    Overlay.of(context).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class AnimatedScrollFloatingWidget extends StatefulWidget {
  const AnimatedScrollFloatingWidget({super.key, required this.child});

  final Widget child;

  @override
  State<AnimatedScrollFloatingWidget> createState() =>
      _AnimatedScrollFloatingWidgetState();
}

class _AnimatedScrollFloatingWidgetState
    extends State<AnimatedScrollFloatingWidget> {
  late Timer _asdfasftimer;
  final double _xTransformScale = 0.15;
  final double _yTransformScale = 0.2;
  bool xRightDirection = true;
  double _width = 0;
  double _height = 0;


  // 是否向下移动
  bool yDownDirection = true;
  int milliseconds = 2000;
  double _topsw = 100.h; //悬浮窗距屏幕或父组件顶部的距离
  double _leftsw = ScreenUtil().screenWidth - 72.h; //悬浮窗距屏幕或父组件左侧的距离



  // 是否向右移动


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topsw = 50+200.h*Random().nextDouble(); //悬浮窗距屏幕或父组件顶部的距离
    _leftsw = 50+(ScreenUtil().screenWidth - 72.h)*Random().nextDouble(); //悬浮窗距屏幕或父组件左侧的距离
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _update();
      _asdfasftimer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
        _update();
      });
    });
  }

  _update() {
    setState(() {
      if (xRightDirection) {
        _leftsw = _width * _xTransformScale + _leftsw;
        if (_leftsw >= _width - 50) {
          _leftsw = _width - 100;

          xRightDirection = false;
        }
      } else {
        _leftsw = _leftsw - _width * _xTransformScale;
        if (_leftsw <= 0) {
          _leftsw = 0;
          xRightDirection = true;
        }
      }

      if (yDownDirection) {
        _topsw = _height * _yTransformScale + _topsw;

        if (_topsw >= _height) {
          _topsw = _height - 100;
          yDownDirection = false;
        }
      } else {
        _topsw = _topsw - _height * _yTransformScale;
        if (_topsw <= 0) {
          _topsw = 0;
          yDownDirection = true;
        }
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        double width = constraint.maxWidth;
        double maxHeight = constraint.maxHeight;
        _width = width;
        _height = maxHeight;
        return Stack(
          children: [
            AnimatedPositioned(
              left: _leftsw,
              top: _topsw,
              duration: Duration(milliseconds: milliseconds + 500),
              curve: Curves.linear,
              child: widget.child,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _asdfasftimer.cancel();
  }
}