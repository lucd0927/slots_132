import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SnowPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SnowPage extends StatelessWidget {
  const SnowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 背景设为深色，以便看清白色雪花
      backgroundColor: const Color(0xFF0F172A),
      body: Stack(
        children: [
          // 背景图或内容（模拟你上传的图片背景）
          const Center(
            child: Text(
              "Winter Vibes",
              style: TextStyle(color: Colors.white54, fontSize: 30),
            ),
          ),

          // 雪花动画层
          const SnowWidget(snowCount: 150),
        ],
      ),
    );
  }
}

/// 雪花粒子模型
class Snowflake {
  double x;
  double y;
  double radius;
  double speed;

  Snowflake({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
  });
}

class SnowWidget extends StatefulWidget {
  final int snowCount;

  const SnowWidget({super.key, this.snowCount = 100});

  @override
  State<SnowWidget> createState() => _SnowWidgetState();
}

class _SnowWidgetState extends State<SnowWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Snowflake> _snowflakes;
  final Random _random = Random();
  double _screenHeight = 0;
  double _screenWidth = 0;

  @override
  void initState() {
    super.initState();
    // 初始化空列表，在 build 中获取屏幕尺寸后再填充
    _snowflakes = [];

    // 创建无限循环的动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // 这里的 duration 不重要，因为我们用 listener
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 初始化雪花
  void _initSnowflakes() {
    _snowflakes.clear();
    for (int i = 0; i < widget.snowCount; i++) {
      _snowflakes.add(Snowflake(
        x: _random.nextDouble() * _screenWidth,
        y: _random.nextDouble() * _screenHeight, // 初始随机分布在屏幕上
        radius: _random.nextDouble() * 2 + 1, // 半径 1.0 ~ 3.0
        speed: _random.nextDouble() * 2 + 1,  // 速度 1.0 ~ 3.0
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: LayoutBuilder(builder: (context, constraints) {
        // 获取当前组件大小
        if (_screenWidth == 0 || _screenHeight == 0) {
          _screenWidth = constraints.maxWidth;
          _screenHeight = constraints.maxHeight;
          _initSnowflakes();
        }
      
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            _updateSnowflakes();
            return CustomPaint(
              painter: SnowPainter(
                  snowflakes: _snowflakes,
                  screenHeight: _screenHeight
              ),
              size: Size.infinite,
            );
          },
        );
      }),
    );
  }

  // 更新每一帧雪花的位置
  void _updateSnowflakes() {
    for (var flake in _snowflakes) {
      flake.y += flake.speed;

      // 如果雪花超出底部，重置到顶部
      if (flake.y > _screenHeight) {
        flake.y = -10; // 从屏幕上方一点点重新开始
        flake.x = _random.nextDouble() * _screenWidth; // 随机新的 X 位置
        flake.speed = _random.nextDouble() * 2 + 1; // 随机新速度
      }
    }
  }
}

class SnowPainter extends CustomPainter {
  final List<Snowflake> snowflakes;
  final double screenHeight;

  SnowPainter({required this.snowflakes, required this.screenHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (var flake in snowflakes) {
      // --- 关键逻辑：计算透明度 ---
      // 位置越靠下 (flake.y 越大)，透明度越低
      // 0.0 (顶部) -> opacity 1.0
      // screenHeight (底部) -> opacity 0.0
      double opacity = 1.0 - (flake.y / screenHeight);

      // 限制 opacity 在 0.0 到 1.0 之间
      opacity = opacity.clamp(0.0, 1.0);

      // 设置颜色和透明度
      paint.color = Colors.white.withOpacity(opacity);

      // 绘制圆形雪花
      canvas.drawCircle(Offset(flake.x, flake.y), flake.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 每一帧都需要重绘
  }
}