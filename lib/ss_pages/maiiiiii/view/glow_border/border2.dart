import 'dart:math' as math;
import 'package:flutter/material.dart';

/// 带多彩渐变、模糊发光与粒子拖尾的动态能量边框
class ParticleGlowBorder extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final double cornerRadius;
  final List<Color> colors; // 多彩渐变颜色
  final Duration duration;
  final double blurSigma; // 模糊强度
  final int particleCount; // 粒子数量
  final bool clockwise; // 顺时针或逆时针旋转

  const ParticleGlowBorder({
    super.key,
    required this.child,
    this.borderWidth = 3.0,
    this.cornerRadius = 16,
    this.colors = const [Colors.cyan, Colors.purple, Colors.pink],
    this.duration = const Duration(seconds: 4),
    this.blurSigma = 8,
    this.particleCount = 12,
    this.clockwise = true,
  });

  @override
  State<ParticleGlowBorder> createState() => _ParticleGlowBorderState();
}

class _ParticleGlowBorderState extends State<ParticleGlowBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: widget.duration)..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ParticleGlowPainter(
        animation: _controller,
        borderWidth: widget.borderWidth,
        cornerRadius: widget.cornerRadius,
        colors: widget.colors,
        blurSigma: widget.blurSigma,
        particleCount: widget.particleCount,
        clockwise: widget.clockwise,
      ),
      child: widget.child,
    );
  }
}

class _ParticleGlowPainter extends CustomPainter {
  final Animation<double> animation;
  final double borderWidth;
  final double cornerRadius;
  final List<Color> colors;
  final double blurSigma;
  final int particleCount;
  final bool clockwise;

  _ParticleGlowPainter({
    required this.animation,
    required this.borderWidth,
    required this.cornerRadius,
    required this.colors,
    required this.blurSigma,
    required this.particleCount,
    required this.clockwise,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final progress = animation.value;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(cornerRadius));
    final path = Path()..addRRect(rrect);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - borderWidth;

    // ==============================
    // 1️⃣ 绘制主旋转渐变光环
    // ==============================
    final gradient = SweepGradient(
      colors: colors + [colors.first],
      transform: GradientRotation(
        (clockwise ? 1 : -1) * progress * math.pi * 2,
      ),
    );

    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = gradient.createShader(rect)
      ..maskFilter = blurSigma > 0
          ? MaskFilter.blur(BlurStyle.outer, blurSigma)
          : null;

    canvas.drawPath(path, borderPaint);

    // ==============================
    // 2️⃣ 粒子拖尾（能量头部 + 渐隐尾部）
    // ==============================
    final angle = (clockwise ? 1 : -1) * progress * math.pi * 2;
    final headColor = colors[(progress * colors.length).floor() % colors.length];

    final particlePaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < particleCount; i++) {
      double t = i / particleCount;
      double fade = (1 - t);
      double sizeFactor = (1 - t) * 8 + 2;
      double particleAngle = angle - (clockwise ? 1 : -1) * t * 0.25;
      double px = center.dx + radius * math.cos(particleAngle);
      double py = center.dy + radius * math.sin(particleAngle);

      final color = Color.lerp(headColor, Colors.white, 0.5)!;

      particlePaint
        ..color = color.withOpacity(fade * 0.9)
        ..maskFilter = blurSigma > 0
            ? MaskFilter.blur(BlurStyle.normal, blurSigma / 2)
            : null;

      canvas.drawCircle(Offset(px, py), sizeFactor, particlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticleGlowPainter oldDelegate) => true;
}
