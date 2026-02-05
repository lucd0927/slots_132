import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_pages/guide/snow_widget.dart';
import 'package:slots_132/ss_pages/guide/testaaa.dart';
import 'package:slots_132/ss_pages/guide/tornado_animation.dart';


// ---------------------------------------------------------------------------
// 1. 演示页面
// ---------------------------------------------------------------------------
class CurvedPageFlipDemo extends StatefulWidget {
  const CurvedPageFlipDemo({super.key, required this.onEnd});
  final VoidCallback onEnd;
  @override
  State<CurvedPageFlipDemo> createState() => _CurvedPageFlipDemoState();
}

class _CurvedPageFlipDemoState extends State<CurvedPageFlipDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isFirstPage = true;

  bool _showLongquanfeng = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800), // 稍微慢一点展示弧度细节
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 0), () {
        setSafeStateIfMounted(() {
          _showLongquanfeng = true;
        });
      });
      Future.delayed(Duration(milliseconds: 200), () {
        _flip();
      });

    });
  }

  setSafeStateIfMounted(VoidCallback fn) {
    if (mounted) {
      setState(fn);
    }
  }

  _flip() {
    if (_controller.isAnimating) return;
    _controller.forward().then((_) {
      setState(() {
        _isFirstPage = !_isFirstPage;
      });
      _controller.reset();
      widget.onEnd();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 两个演示卡片
    final pageA = _buildCard(
      "Chapter 1",
      Colors.teal.shade700,
      Icons.landscape,
    );
    final pageB = _buildCard("Chapter 2", Colors.indigo.shade800, Icons.waves);

    return GestureDetector(
      onTap: _flip,
      child: Stack(
        children: [
          CurvedPageTurnTransition(
            animation: _controller,
            currentPage: _isFirstPage ? pageA : pageB,
            nextPage: _isFirstPage ? pageB : pageA,
          ),
          SnowWidget(),
          AnimatedPositioned(
            // bottom: !_showLongquanfeng?0.h:360.h,
            // left: 0,
            right: _showLongquanfeng?500.w:0,
            bottom:_showLongquanfeng? 360.h:0,
            duration: Duration(milliseconds: 1200),
            child: TornadoAnimation(),
          ),
           AnimatedPositioned(
            // bottom: !_showLongquanfeng?0.h:360.h,
            // left: 0,
            right: _showLongquanfeng?500.w:-400.w,
            bottom:_showLongquanfeng? 360.h:0,
            duration: Duration(milliseconds: 1200),
            child: TornadoAnimation(),
          ),

          AnimatedPositioned(
            // bottom: !_showLongquanfeng?0.h:360.h,
            // left: 0,
            right: _showLongquanfeng?500.w:-200.w,
            bottom:_showLongquanfeng? 360.h:0,
            duration: Duration(milliseconds: 1000),
            child: TornadoAnimation(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard2(String text, Color color, IconData icon) {
    return Image.asset(
      Assets.imga2.guide01.path,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }

  Widget _buildCard(String text, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            Assets.imga2.guide00.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          // MovingTornadoAnimation(screenWidth:  double.infinity, screenHeight:  double.infinity,),

        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 2. 核心组件：带弧度的翻页
// ---------------------------------------------------------------------------
class CurvedPageTurnTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget currentPage;
  final Widget nextPage;

  const CurvedPageTurnTransition({
    super.key,
    required this.animation,
    required this.currentPage,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final double t = animation.value;
        if (t == 0.0) return currentPage;

        return SizedBox(
          child: Stack(
            fit: StackFit.passthrough, // 确保大小适配
            children: [
              // 1. 底层：下一页
              nextPage,

              // // 2. 中间层：当前页 (通过 ClipPath 切割)
              // // 这里我们仍然使用直线切割，因为复杂的曲线切割消耗极大且视觉差异在底部不明显
              // ClipPath(clipper: _StraightClipper(t), child: currentPage),
              //
              // // 3. 顶层：绘制卷曲的纸背 + 阴影
              // // 这里是 "弧度" 的来源
              // CustomPaint(
              //   painter: _CurvedPagePainter(t),
              //   child: Container(), // 撑满父组件
              // ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// 3. 几何数学工具
// ---------------------------------------------------------------------------
class _MathUtil {
  // 计算拖拽点位置
  static Offset getDragPoint(Size size, double t) {
    // 模拟从右下角往左上角掀
    final start = Offset(size.width, size.height);
    // 终点稍微超出左上角，保证完全翻过去
    final end = Offset(-size.width * 3, size.height * 0.1);

    // 使用非线性曲线让动作更自然
    final curT = Curves.easeInOutCubic.transform(t);

    return Offset(
      ui.lerpDouble(start.dx, end.dx, curT)!,
      ui.lerpDouble(start.dy, end.dy, curT)!,
    );
  }
}

// ---------------------------------------------------------------------------
// 4. 裁剪器 (保持直线裁剪，性能更好，视觉上被顶层覆盖)
// ---------------------------------------------------------------------------
class _StraightClipper extends CustomClipper<Path> {
  final double t;

  _StraightClipper(this.t);

  @override
  Path getClip(Size size) {
    final dragPoint = _MathUtil.getDragPoint(size, t);
    final corner = Offset(size.width, size.height);

    // 简单的垂直平分线逻辑
    final mid = (corner + dragPoint) / 2;
    final vector = dragPoint - corner;

    // 避免除以0
    if (vector.dy == 0)
      return Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final k = -vector.dx / vector.dy; // 垂直斜率
    final b = mid.dy - k * mid.dx;

    // 计算交点
    final yRight = k * size.width + b;
    final xBottom = (size.height - b) / k;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // 右边界处理
    if (yRight < 0) {
      // 切到上边了
      path.lineTo(-b / k, 0);
    } else if (yRight > size.height) {
      path.lineTo(size.width, size.height);
    } else {
      path.lineTo(size.width, yRight);
    }

    // 下边界处理
    if (xBottom < 0) {
      path.lineTo(0, b);
    } else if (xBottom > size.width) {
      // 已在上面处理
    } else {
      path.lineTo(xBottom, size.height);
    }

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _StraightClipper oldClipper) => true;
}

// ---------------------------------------------------------------------------
// 5. 绘制器：核心逻辑，绘制带弧度的卷纸
// ---------------------------------------------------------------------------
class _CurvedPagePainter extends CustomPainter {
  final double t;

  _CurvedPagePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    if (t <= 0 || t >= 1) return;

    final corner = Offset(size.width, size.height);
    final dragPoint = _MathUtil.getDragPoint(size, t);

    // --- 1. 计算几何关键点 ---
    final mid = (corner + dragPoint) / 2;
    final vector = dragPoint - corner;
    // 垂直平分线斜率
    final k = -vector.dx / (vector.dy == 0 ? 0.001 : vector.dy);
    final b = mid.dy - k * mid.dx;

    // 折痕与边界的交点 (P1 在右边, P2 在下边)
    // 注意：这里只处理了右下角起翻的最简单情况
    // 实际项目中需要处理所有边界情况，这里为了代码简洁做了假设
    Offset p1 = Offset(size.width, k * size.width + b); // 右交点
    Offset p2 = Offset((size.height - b) / k, size.height); // 下交点

    // 边界保护：如果翻过了头，交点可能跑偏，这里做简单钳制以保证演示不崩
    if (p1.dy < 0) p1 = Offset(-b / k, 0); // 跑到上边
    if (p2.dx < 0) p2 = Offset(0, b); // 跑到左边

    // --- 2. 绘制 "下一页" 的投影阴影 (Drop Shadow) ---
    // 在折痕处画一条模糊的黑线，模拟纸张遮挡
    final pathShadow = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy);

    canvas.drawPath(
      pathShadow,
      Paint()
        ..color = Colors.black.withOpacity(0.4)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // --- 3. 构建卷曲形状 (Curled Shape) ---
    // 这里的关键是使用 Bezier 曲线，而不是直线连接 dragPoint
    final curlPath = Path();
    curlPath.moveTo(p1.dx, p1.dy);

    // 控制点计算：
    // 我们需要让边缘向内或向外弯曲。
    // 计算 P1 到 DragPoint 的中点，然后向垂直方向偏移一点
    // 简单的模拟：使用 lerp 找中点，不偏移，直接用 quadraticBezierTo
    // 为了更有弧度，我们将控制点设为 (P1 + DragPoint)/2 往 "圆柱中心" 偏移一点的位置

    // 简单做法：直接用 quadraticBezierTo，控制点设为直连线的中点偏离一点
    // 这里为了演示弧度，使用三次贝塞尔，或者简单的二次贝塞尔

    // 曲线 1: P1 -> DragPoint
    // 控制点取 P1 和 DragPoint 之间的某个点，稍微往 "角" (corner) 的反方向偏移
    // 但其实如果不偏移，单纯用贝塞尔连接，如果控制点合适，也能出效果。

    // 更好的视觉欺骗：
    // 不要把 DragPoint 当做尖尖的顶点。
    // 真实的卷纸是一个圆弧边。
    // 我们构建一个圆弧来代替 DragPoint。

    // 简化版弧度绘制：
    // P1 -> Control1 -> DragPoint -> Control2 -> P2

    // 这里使用简单的线性插值作为控制点，但是改变绘制填充方式
    curlPath.quadraticBezierTo(
      (p1.dx + dragPoint.dx) / 2 + (size.width * 0.05), // X 偏移
      (p1.dy + dragPoint.dy) / 2 - (size.height * 0.05), // Y 偏移
      dragPoint.dx,
      dragPoint.dy,
    );

    curlPath.quadraticBezierTo(
      (p2.dx + dragPoint.dx) / 2 - (size.width * 0.05),
      (p2.dy + dragPoint.dy) / 2 + (size.height * 0.05),
      p2.dx,
      p2.dy,
    );

    curlPath.close();

    // --- 4. 绘制卷曲纸背 (白色底) ---
    final Paint paperPaint = Paint()..color = Colors.transparent;
    canvas.drawPath(curlPath, paperPaint);

    // --- 5. 关键：绘制圆柱体光影 (Gradient) ---
    // 为了让它看起来像圆柱，我们需要一个与折痕平行的线性渐变
    // 从折痕(深) -> 中间(亮) -> 边缘(灰)

    // 保存画布状态，进行旋转绘制渐变
    canvas.save();

    // 计算旋转角度：折痕的角度
    // vector 是 dragPoint - corner
    // 折痕垂直于 vector
    double angle = atan2(vector.dy, vector.dx); // 这是 vector 的角度
    // 折痕角度是 angle + 90度 (pi/2) 或 angle - 90度
    // 我们需要旋转画布，使得渐变可以沿 Y 轴或 X 轴绘制

    // 简单方法：使用 Shader
    final shaderRect = Rect.fromCenter(
      center: mid,
      width: size.width * 2, // 足够大覆盖
      height: vector.distance / 2, // 卷曲的半径范围
    );

    // 创建一个模拟圆柱曲面的渐变
    // 0.0 (折痕处) -> 1.0 (拖拽点处)
    final gradient = ui.Gradient.linear(
      mid, // 渐变起点 (折痕中心)
      dragPoint, // 渐变终点 (卷起顶点)
      [
        Colors.black.withOpacity(0.1), // 折痕深处阴影
        Colors.white.withOpacity(0.0), // 高光过渡
        Colors.white.withOpacity(0.4), // 纸张高光
        Colors.black.withOpacity(0.1), // 纸张边缘阴影
      ],
      [0.0, 0.2, 0.8, 1.0], // 颜色分布位置
    );

    final Paint shadowPaint = Paint()
      ..shader = gradient
      ..blendMode = BlendMode.srcATop; // 叠加在白纸上

    canvas.drawPath(curlPath, shadowPaint);
    canvas.restore();

    // 勾勒边缘线，增加清晰度
    canvas.drawPath(
      curlPath,
      Paint()
        ..color = Colors.black12
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant _CurvedPagePainter oldDelegate) => true;
}
