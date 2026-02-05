import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TornadoAnimation extends StatefulWidget {
  const TornadoAnimation({super.key});

  @override
  State<TornadoAnimation> createState() => _TornadoAnimationState();
}

class _TornadoAnimationState extends State<TornadoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<TornadoParticle> _particles = [];
  final int _particleCount = 400; // 粒子数量，越多越密集但消耗性能

  @override
  void initState() {
    super.initState();
    // 初始化粒子
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(TornadoParticle(randomizeHeight: true));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 这一帧无关紧要，因为我们在loop
    )..addListener(() {
      _updateParticles();
    })
      ..repeat();
  }

  void _updateParticles() {
    setState(() {
      for (var particle in _particles) {
        particle.update();
      }
      // 根据 Z 轴深度排序，确保后面的粒子先画，前面的粒子后画（遮挡关系）
      _particles.sort((a, b) => a.z.compareTo(b.z));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TornadoPainter(particles: _particles),
      size: Size(300.w, 500.h),
    );
  }
}

/// 粒子类
class TornadoParticle {
  double y = 0; // 高度 (0.0 到 1.0)
  double angle = 0; // 当前旋转角度
  double speed = 0; // 旋转速度
  double radius = 0; // 粒子大小
  double z = 0; // 模拟深度 (-1 到 1)
  Color color = Colors.white;

  final Random _rnd = Random();

  TornadoParticle({bool randomizeHeight = false}) {
    reset(randomizeHeight: randomizeHeight);
  }

  void reset({bool randomizeHeight = false}) {
    // 如果是初始化，高度随机分布；如果是重置，从底部开始
    y = randomizeHeight ? _rnd.nextDouble() : 0.0;

    angle = _rnd.nextDouble() * 2 * pi;
    // 底部旋转快，顶部旋转慢，或者反过来，这里设定为随机速度增加一点混乱感
    speed = 0.05 + _rnd.nextDouble() * 0.05;

    // 粒子自身大小随机
    radius = 2.0 + _rnd.nextDouble() * 3.0;

    // 颜色可以是灰色、白色、淡蓝色混杂
    int grayScale = 150 + _rnd.nextInt(105);
    // color = Color.fromARGB(255, grayScale, grayScale, grayScale + 20);
  }

  void update() {
    // 粒子向上升
    y += 0.005;

    // 旋转
    angle += speed;

    // 如果超出顶部，重置到底部
    if (y > 1.0) {
      reset();
    }
  }
}

/// 画布绘制器
class TornadoPainter extends CustomPainter {
  final List<TornadoParticle> particles;

  TornadoPainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height); // 龙卷风底部中心

    for (var particle in particles) {
      // 1. 计算漏斗形状半径 (Funnel Shape)
      // 底部窄 (minWidth)，顶部宽 (maxWidth)
      // 使用 pow 让形状呈曲线（指数级增长），而不是直的圆锥
      double funnelRadius = 10 + (size.width * 0.4) * pow(particle.y, 1.2);

      // 2. 计算龙卷风的摆动 (Wiggle effect)
      // 随着高度 y 增加，中心点左右摇摆
      double wiggleOffset = sin(Date.now() / 300.h + particle.y * 10) * (30 * particle.y);

      // 3. 计算 3D 坐标投影到 2D
      // x = 中心 + 摇摆 + 旋转半径 * cos
      double x = center.dx + wiggleOffset + cos(particle.angle) * funnelRadius;

      // y = 底部 - 高度 * 总高度
      // 这里加了一点 sin(angle) * tilt 来模拟俯视/仰视的透视感
      double tilt = 20.0 * particle.y;
      double y = center.dy - (particle.y * size.height) + sin(particle.angle) * tilt;

      // 4. 更新粒子的 Z 值用于排序 (用于 Painter 外部的 sort，但在这里计算逻辑)
      particle.z = sin(particle.angle);

      // 5. 根据深度调整透明度和大小 (模拟雾气效果)
      // z 在 -1 (后面) 到 1 (前面)
      double depthScale = 0.6 + ((particle.z + 1) / 2) * 0.4; // 0.6 到 1.0
      double opacity = 0.3 + ((particle.z + 1) / 2) * 0.7; // 后面的淡，前面的实

      final paint = Paint()
        ..color = particle.color.withOpacity(opacity.clamp(0.0, 1.0))
        ..style = PaintingStyle.fill;

      // 绘制粒子
      canvas.drawCircle(Offset(x, y), particle.radius * depthScale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// 辅助类用于获取当前时间戳模拟摆动动画
class Date {
  static double now() {
    return DateTime.now().millisecondsSinceEpoch.toDouble();
  }
}