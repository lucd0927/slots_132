import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:zo_animated_border/painter/zo_track_painter.dart';

enum ZoMonoCromeBorderStyle { stroke, repeated, mirror }

extension GetBorderStyle on ZoMonoCromeBorderStyle {
  TileMode get value {
    switch (this) {
      case ZoMonoCromeBorderStyle.stroke:
        return TileMode.clamp;
      case ZoMonoCromeBorderStyle.repeated:
        return TileMode.repeated;
      case ZoMonoCromeBorderStyle.mirror:
        return TileMode.mirror;
    }
  }
}

/// ![mono_chrome (online-video-cutter com)](https://github.com/user-attachments/assets/d798997d-a68c-447e-90e1-5e8fc8dd56bf)
class ZoMonoCromeBorder extends StatefulWidget {
  final Widget child;

  final ValueChanged<AnimationController>? controller;

  final Duration animationDuration;

  final double cornerRadius;

  final double borderWidth;

  final Color trackBorderColor;

  final EdgeInsets padding;

  final ZoMonoCromeBorderStyle borderStyle;
  final Curve animationCurve;

  const ZoMonoCromeBorder({
    required this.child,
    this.controller,
    this.animationDuration = const Duration(seconds: 4),
    this.cornerRadius = 0.0,
    this.borderWidth = 1,
    this.animationCurve = Curves.linear,
    this.trackBorderColor = Colors.red,
    this.padding = EdgeInsets.zero,
    this.borderStyle = ZoMonoCromeBorderStyle.stroke,
    super.key,
  });

  @override
  ZoMonoCromeBorderState createState() => ZoMonoCromeBorderState();
}

class ZoMonoCromeBorderState extends State<ZoMonoCromeBorder>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _curveAnimation;

  @override
  void didUpdateWidget(ZoMonoCromeBorder oldWidget) {
    if (oldWidget != oldWidget) {
      _controller?.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.reverse) {}
          });

    _controller?.repeat();
    _curveAnimation = CurvedAnimation(
      parent: _controller!,
      curve: widget.animationCurve,
    );

    if (_controller != null) {
      widget.controller?.call(_controller!);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ZoTrackPainter(
        animation: _curveAnimation!,
        cornerRadius: widget.cornerRadius,
        trackWidth: widget.borderWidth,
        trackBorderColor: widget.trackBorderColor,
        borderStyle: widget.borderStyle,
      ),
      child: Padding(padding: widget.padding, child: widget.child),
    );
  }

  int getRandomNumber() {
    var random = math.Random();
    return (random.nextInt(20) + 6);
  }
}

class ZoTrackPainter extends CustomPainter {
  /// Animation of the AnimationController
  final Animation animation;

  /// Corner radius of the border
  final double cornerRadius;

  /// Width of the border
  final double trackWidth;

  /// Color of the border
  final Color trackBorderColor;

  final ZoMonoCromeBorderStyle borderStyle;

  ZoTrackPainter({
    required this.animation,
    required this.cornerRadius,
    required this.trackWidth,
    required this.trackBorderColor,
    this.borderStyle = ZoMonoCromeBorderStyle.stroke,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    /// Painting the border
    final rect = Offset.zero & size;
    final paint = Paint()..color = Colors.transparent;
    final progress = animation.value;

    if (progress > 0.0) {
      paint.color = trackBorderColor;
      paint.shader = SweepGradient(
        tileMode: borderStyle.value,
        colors: [
          trackBorderColor.withValues(alpha: 0),
          trackBorderColor.withValues(alpha: 0),

          // Colors.pink,
          trackBorderColor,
        ],
        stops: const [0.0, 0.5, 1],
        startAngle: 0,
        endAngle: math.pi * 2,
        transform: GradientRotation((math.pi * 2 * progress)),
      ).createShader(rect);
    }

    var rRect = RRect.fromRectAndRadius(rect, Radius.circular(cornerRadius));

    final path = Path()..addRRect(rRect);

    canvas.drawRRect(
      rRect,
      paint
        ..strokeWidth = trackWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ZoTrackPainter oldDelegate) => true;
}
