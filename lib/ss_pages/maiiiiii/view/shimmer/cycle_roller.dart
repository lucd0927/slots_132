import 'dart:math';

import 'package:flutter/material.dart';

/// 一个通用圆形闪光特效组件，可用于任意子Widget
class CircularShiningEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool enabled;
  final double shineRadius; // 闪光半径占比（相对控件宽度）
  final Color shineColor;
  final double opacity;

  const CircularShiningEffect({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.enabled = true,
    this.shineRadius = 0.2,
    this.shineColor = Colors.white,
    this.opacity = 0.6,
  });

  @override
  State<CircularShiningEffect> createState() => _CircularShiningEffectState();
}

class _CircularShiningEffectState extends State<CircularShiningEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: widget.duration);

    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant CircularShiningEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.enabled && _controller.isAnimating) {
      _controller.stop();
    }
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      if (widget.enabled) {
        _controller
          ..reset()
          ..repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 让闪光点在圆形路径上移动
  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final percent = _controller.value;

        return ShaderMask(
          blendMode: BlendMode.plus,
          shaderCallback: (Rect bounds) {
            final double width = bounds.width;
            final double height = bounds.height;
            final Offset center = Offset(width / 2, height / 2);

            // 闪光半径（控制大小）
            final double radius = width * widget.shineRadius;

            // 根据 percent 让光点绕着中心旋转
            final double angle = percent * 2 * 3.1415926;
            final Offset movingCenter = Offset(
              center.dx + (width / 2) * 0.6 * cos(angle),
              center.dy + (height / 2) * 0.6 * sin(angle),
            );

            final gradient = RadialGradient(
              center: Alignment.center,
              colors: [
                widget.shineColor.withOpacity(widget.opacity),
                Colors.transparent,
              ],
              stops: const [0.0, 1.0],
            );

            // 以光点为圆心绘制径向渐变
            return gradient.createShader(
              Rect.fromCircle(center: movingCenter, radius: radius),
            );
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
