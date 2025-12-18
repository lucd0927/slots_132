import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/log.dart';

class OverlayFly2TargetKey {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({
    required Widget heroChild,
    required BuildContext targetContext,
    required BuildContext childContext,
    int count = 1,
    VoidCallback? onEnd,
  }) {
    try {
      _overlay = null;
      List<Widget> children = [];

      for (int i = 0; i < count; i++) {
        children.add(heroChild);
      }
      if (children.isEmpty) {
        return;
      }

      RenderBox box = childContext!.findRenderObject() as RenderBox;
      Size startSize = box.size;
      var topLeftPosition = box.localToGlobal(Offset.zero);
      if (targetContext != null && targetContext!.mounted) {
        RenderBox targetBox = targetContext!.findRenderObject() as RenderBox;
        Size endSize = targetBox.size;
        var targetLocation = targetBox.localToGlobal(Offset.zero);
        ssLogggg(
          "=show==topLeftPosition:$topLeftPosition==targetLocation:$targetLocation",
        );
        _innerOverlay(
          children,
          topLeftPosition,
          targetLocation,
          startSize,
          endSize,
          onEnd,
        );
      }
    } catch (e) {
      ssLogggg("==SWAnimatedWidgetOverlay==error:$e=");
    }
  }

  void _innerOverlay(
    List<Widget> children,
    Offset topLeftPosition,
    Offset targetLocation,
    Size startSize,
    Size endSize,
    VoidCallback? onEnd, {
    Duration animTime = const Duration(milliseconds: 800),
    Duration delayBetween = const Duration(milliseconds: 50),
  }) {
    _overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.red.withValues(alpha: 0.0),
          child: IgnorePointer(
            child: _Source2FlyTarget(
              start: topLeftPosition,
              end: targetLocation,
              arcHeight: 10,
              startSize: startSize,
              endSize: endSize,
              duration: animTime,
              delayBetween: delayBetween,
              onFinish: () {
                close();
                if (onEnd != null) {
                  onEnd();
                }
              },
              children: children,
            ),
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void showWithSize({
    Widget? heroChild,
    required Size childSize,
    required BuildContext targetContext,
    int count = 1,
    VoidCallback? onEnd,
    Offset? topLeftOffset,
    Duration animTime = const Duration(milliseconds: 800),
  }) {
    // if (_isShowing) return;
    _overlay = null;

    List<Widget> children = [];
    heroChild ??= Image.asset(
      Assets.img.money.path,
      width: 30.h,
      height: 28.h,
      fit: BoxFit.fill,
    );
    for (int i = 0; i < count; i++) {
      children.add(heroChild);
    }

    if (children.isEmpty) {
      return;
    }

    Size startSize = childSize;
    var topLeftPosition =
        topLeftOffset ??
        Offset(
          ScreenUtil().screenWidth / 2 - startSize.width / 2,
          ScreenUtil().screenHeight / 2,
        );
    if (targetContext != null && targetContext!.mounted) {
      RenderBox targetBox = targetContext!.findRenderObject() as RenderBox;
      Size endSize = targetBox.size;
      var targetLocation = targetBox.localToGlobal(Offset.zero);
      ssLogggg(
        "=showWithSize==topLeftPosition:$topLeftPosition==targetLocation:$targetLocation",
      );
      _innerOverlay(
        children,
        topLeftPosition,
        targetLocation,
        startSize,
        endSize,
        onEnd,
        animTime: animTime,
        delayBetween: Duration(milliseconds: 50)
      );
    }
  }

  void showWithSizeAndEndPosition({
    Widget? heroChild,
    required Size childSize,
    Size? endSize,
    required Offset targetLocation,
    int count = 1,
    VoidCallback? onEnd,
    Offset? topLeftOffset,
    Duration animTime = const Duration(milliseconds: 400),
    Duration delayBetween = const Duration(milliseconds: 50),
  }) {
    // if (_isShowing) return;
    _overlay = null;

    List<Widget> children = [];
    heroChild ??= Image.asset(
      Assets.img.money.path,
      width: 30.h,
      height: 28.h,
      fit: BoxFit.fill,
    );
    for (int i = 0; i < count; i++) {
      children.add(heroChild);
    }

    if (children.isEmpty) {
      return;
    }

    Size startSize = childSize;
    var topLeftPosition =
        topLeftOffset ??
        Offset(
          ScreenUtil().screenWidth / 2 - startSize.width / 2,
          ScreenUtil().screenHeight / 2,
        );
    if (true) {
      Size endSize2 = endSize ?? Size(40.w, 40.h);

      ssLogggg(
        "=showWithSize==topLeftPosition:$topLeftPosition==targetLocation:$targetLocation",
      );
      _innerOverlay(
        children,
        topLeftPosition,
        targetLocation,
        startSize,
        endSize2,
        onEnd,
        animTime: animTime,
        delayBetween: delayBetween,
      );
    }
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
    // childContext = null;
    // targetContext = null;
  }
}

class _Source2FlyTarget extends StatefulWidget {
  final List<Widget> children;
  final Offset start;
  final Offset end;
  final double arcHeight;
  final Duration duration;
  final Duration delayBetween; // 每个 widget 的启动间隔
  final VoidCallback? onFinish;
  final Size startSize; // 初始大小
  final Size endSize; // 最终大小

  const _Source2FlyTarget({
    super.key,
    required this.children,
    required this.start,
    required this.end,
    this.arcHeight = 80,
    this.duration = const Duration(milliseconds: 1000),
    this.delayBetween = const Duration(milliseconds: 50),
    required this.startSize,
    required this.endSize,
    this.onFinish,
  });

  @override
  State<_Source2FlyTarget> createState() => _Source2FlyTargetState();
}

class _Source2FlyTargetState extends State<_Source2FlyTarget>
    with TickerProviderStateMixin {
  final List<_FlyModel> _items = [];

  @override
  void initState() {
    super.initState();
    _startAllAnimations();
  }

  void _startAllAnimations() {
    for (int i = 0; i < widget.children.length; i++) {
      Future.delayed(widget.delayBetween * i, () {
        _createFlyingItem(widget.children[i], i == widget.children.length - 1);
      });
    }
  }

  void _createFlyingItem(Widget widgetToFly, bool isLast) {
    final controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    // final animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final dx = widget.start.dx;
    final dy = widget.start.dy;
    double random = Random().nextDouble() * 0 - 0;
    double random2 = Random().nextDouble() * 0 - 0;
    Offset middleOffset = Offset(dx + random, dy + random2);
    // 多段动画
    var animation = TweenSequence<Offset>([
      // 第一段：从 start -> middle
      // TweenSequenceItem(
      //   tween: Tween(
      //     begin: widget.start,
      //     end: middleOffset,
      //   ).chain(CurveTween(curve: Curves.easeInOut)),
      //   weight: 3, // 权重决定时长比例
      // ),
      // // // 第二段：停留在 middle
      // TweenSequenceItem(
      //   tween: ConstantTween(middleOffset),
      //   weight: 4, // 停留时长
      // ),
      // 第三段：middle -> end
      TweenSequenceItem(
        tween: Tween(
          begin: widget.start,
          end: widget.end,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 3,
      ),

      // TweenSequenceItem(
      //   tween: Tween(
      //     begin: widget.start,
      //     end: widget.end,
      //   ).chain(CurveTween(curve: Curves.easeInOut)),
      //   weight: 6,
      // ),
    ]).animate(controller);
    final flyingItem = _FlyModel(
      widget: widgetToFly,
      animation: animation,
      controller: controller,
    );

    setState(() => _items.add(flyingItem));

    controller.forward().whenComplete(() {
      setState(() => _items.remove(flyingItem));
      if (isLast) widget.onFinish?.call();
    });
  }

  double _calcY2(double t, double y0, double y1, double arcHeight) {
    final parabolic = 4 * arcHeight * t * (1 - t); // 抛物线
    return lerpDouble(y0, y1, t)! - parabolic;
  }

  double? lerpDouble(double a, double b, double t) => a + (b - a) * t;

  @override
  void dispose() {
    for (final item in _items) {
      item.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final positionTween = Tween<Offset>(
      begin: widget.start,
      end: widget.end,
    ).chain(CurveTween(curve: Curves.easeInOut));
    final sizeTween = Tween<Size>(
      begin: widget.startSize,
      end: widget.endSize,
    ).chain(CurveTween(curve: Curves.easeInOut));
    // ssLogggg("===size:${widget.startSize}==widget.endSize:${widget.endSize}");
    return Stack(
      children: _items.map((item) {
        return AnimatedBuilder(
          animation: item.animation,
          builder: (_, __) {
            final t = item.animation.value;
            final pos = positionTween.evaluate(item.controller);
            final size = sizeTween.evaluate(item.controller);
            // ssLogggg("===size:$size==");
            // final dx = lerpDouble(widget.start.dx, widget.end.dx, item.controller.value)!;
            // final dy = _calcY(
            //   item.controller.value,
            //   widget.start.dy,
            //   widget.end.dy,
            //   widget.arcHeight,
            // );

            final dx = t.dx;
            final dy = t.dy;

            // 处理大小插值
            double width = size.width;
            double height = size.height;

            Widget child = item.widget;
            if (widget.startSize != null && widget.endSize != null) {
              child = Container(
                width: width,
                height: height,
                color: Colors.teal.withValues(alpha: 0.0),
                child: FittedBox(fit: BoxFit.contain, child: item.widget),
              );
            }

            return Positioned(left: dx, top: dy, child: child);
          },
        );
      }).toList(),
    );
  }
}

class _FlyModel {
  final Widget widget;
  final Animation<Offset> animation;
  final AnimationController controller;

  _FlyModel({
    required this.widget,
    required this.animation,
    required this.controller,
  });
}
