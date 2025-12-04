import 'package:flutter/material.dart';

enum ShakeMode {
  translate, // 平移抖动
  rotate,    // 旋转抖动
}

class SSHuangdongWidget extends StatefulWidget {
  final Widget child;
  final Duration duration; // 单次抖动动画时长
  final double offset; // 抖动幅度
  final Axis axis; // 平移方向
  final ShakeMode mode; // 抖动模式
  final Duration pause; // 抖动后停顿时间
  final bool autoPlay; // 是否自动运行

  const SSHuangdongWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = 10.0,
    this.axis = Axis.horizontal,
    this.mode = ShakeMode.translate,
    this.pause = const Duration(seconds: 2),
    this.autoPlay = true,
  });

  @override
  State<SSHuangdongWidget> createState() => _SSHuangdongWidgetState();
}

class _SSHuangdongWidgetState extends State<SSHuangdongWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: widget.offset)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);

    if (widget.autoPlay) {
      _startLoop();
    }
  }

  /// 自动循环：抖动一次 → 停顿 → 再抖动
  void _startLoop() async {
    while (mounted && widget.autoPlay) {
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(widget.pause); // 停顿
    }
  }

  /// 手动触发一次抖动
  Future<void> shakeOnce() async {
    await _controller.forward();
    await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        if (widget.mode == ShakeMode.translate) {
          final offset = widget.axis == Axis.horizontal
              ? Offset(_animation.value, 0)
              : Offset(0, _animation.value);
          return Transform.translate(offset: offset, child: child);
        } else {
          return Transform.rotate(
            angle: _animation.value * 0.01,
            child: child,
          );
        }
      },
      child: widget.child,
    );
  }
}