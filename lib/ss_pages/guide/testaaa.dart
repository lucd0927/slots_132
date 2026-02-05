// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     home: MovingTornadoDemo(),
//     debugShowCheckedModeBanner: false,
//   ));
// }
//
// class MovingTornadoDemo extends StatelessWidget {
//   const MovingTornadoDemo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1a1a2e),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           // 将屏幕尺寸传递给动画组件
//           return MovingTornadoAnimation(
//             screenWidth: constraints.maxWidth,
//             screenHeight: constraints.maxHeight,
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MovingTornadoAnimation extends StatefulWidget {
//   final double screenWidth;
//   final double screenHeight;
//
//   const MovingTornadoAnimation({
//     super.key,
//     required this.screenWidth,
//     required this.screenHeight,
//   });
//
//   @override
//   State<MovingTornadoAnimation> createState() => _MovingTornadoAnimationState();
// }
//
// class _MovingTornadoAnimationState extends State<MovingTornadoAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final List<TornadoParticle> _particles = [];
//   final int _particleCount = 450; // 稍微增加粒子数
//
//   // 龙卷风当前的 X 坐标
//   double _tornadoX = 100.0;
//   // 移动速度
//   double _moveSpeed = 2.0;
//
//   @override
//   void initState() {
//     super.initState();
//     // 初始化粒子
//     for (int i = 0; i < _particleCount; i++) {
//       _particles.add(TornadoParticle(randomizeHeight: true));
//     }
//
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..addListener(_updateLoop)..repeat();
//   }
//
//   void _updateLoop() {
//     setState(() {
//       // 1. 更新龙卷风的整体位置 (从左往右)
//       _tornadoX += _moveSpeed;
//
//       // 如果完全移出右侧屏幕，重置到左侧屏幕外
//       if (_tornadoX < widget.screenWidth + 100) {
//         _tornadoX = 100;
//       }
//
//       // 2. 更新所有粒子内部状态
//       for (var particle in _particles) {
//         particle.update();
//       }
//
//       // 3. Z轴排序 (画画的前后顺序)
//       _particles.sort((a, b) => a.z.compareTo(b.z));
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: TornadoPainter(
//         particles: _particles,
//         tornadoX: _tornadoX,
//         tornadoHeight: widget.screenHeight,
//       ),
//       size: Size(widget.screenWidth, widget.screenHeight),
//     );
//   }
// }
//
// /// 粒子类
// class TornadoParticle {
//   double y = 0; // 0.0 ~ 1.0 (相对高度)
//   double angle = 0;
//   double speed = 0;
//   double radius = 0;
//   double z = 0;
//   Color color = Colors.white;
//   final Random _rnd = Random();
//
//   TornadoParticle({bool randomizeHeight = false}) {
//     reset(randomizeHeight: randomizeHeight);
//   }
//
//   void reset({bool randomizeHeight = false}) {
//     y = randomizeHeight ? _rnd.nextDouble() : 0.0;
//     angle = _rnd.nextDouble() * 2 * pi;
//     speed = 0.08 + _rnd.nextDouble() * 0.08; // 旋转速度稍微加快
//     radius = 3.0 + _rnd.nextDouble() * 4.0;
//
//     // 颜色增加一点混乱的深灰色，更有风暴感
//     int grayScale = 120 + _rnd.nextInt(135);
//     color = Color.fromARGB(255, grayScale, grayScale, grayScale + 20);
//   }
//
//   void update() {
//     y += 0.006; // 上升速度
//     angle += speed;
//     if (y > 1.0) reset();
//   }
// }
//
// /// 画布绘制器
// class TornadoPainter extends CustomPainter {
//   final List<TornadoParticle> particles;
//   final double tornadoX; // 龙卷风当前的中心X坐标
//   final double tornadoHeight;
//
//   TornadoPainter({
//     required this.particles,
//     required this.tornadoX,
//     required this.tornadoHeight,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // 龙卷风底部的中心点
//     final center = Offset(tornadoX, size.height);
//
//     for (var particle in particles) {
//       // --- 形状计算 ---
//
//       // 1. 漏斗宽度：底部窄，顶部宽
//       double funnelRadius = 15 + (size.height * 0.35) * pow(particle.y, 1.5);
//
//       // 2. 自身扭动 (Wiggle)：正弦波让龙卷风像蛇一样扭
//       // 使用 particle.y * 12 控制波浪的频率
//       double wiggleOffset = sin(DateTime.now().millisecondsSinceEpoch / 400 + particle.y * 12) * (20 * particle.y);
//
//       // 3. 移动时的倾斜 (Tilt/Drag Effect)
//       // 模拟风阻：顶部(y=1)会稍微落在后面，或者底部(y=0)跑得快。
//       // 这里让顶部稍微往左偏一点 (减去 x)，产生一种“底部拖着顶部跑”的视觉惯性
//       double moveTilt = -50 * particle.y;
//
//       // --- 坐标计算 ---
//
//       // X: 中心移动位置 + 自身旋转X + 扭动偏移 + 移动倾斜
//       double x = center.dx + (cos(particle.angle) * funnelRadius) + wiggleOffset + moveTilt;
//
//       // Y: 底部 - 相对高度 + 3D透视倾斜
//       // sin(angle) * 20 让圆环看起来有立体倾角
//       double y = center.dy - (particle.y * size.height * 0.8) + (sin(particle.angle) * 25 * particle.y);
//
//       // --- 深度与颜色 ---
//
//       particle.z = sin(particle.angle); // 更新深度用于排序逻辑
//
//       // 越靠后越小、越透明
//       double depthScale = 0.5 + ((particle.z + 1) / 2) * 0.5;
//       double opacity = 0.2 + ((particle.z + 1) / 2) * 0.8;
//
//       final paint = Paint()
//         ..color = particle.color.withOpacity(opacity.clamp(0.0, 1.0))
//         ..style = PaintingStyle.fill;
//
//       canvas.drawCircle(Offset(x, y), particle.radius * depthScale, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant TornadoPainter oldDelegate) {
//     // 只要位置变了或者粒子变了就重绘
//     return oldDelegate.tornadoX != tornadoX;
//   }
// }