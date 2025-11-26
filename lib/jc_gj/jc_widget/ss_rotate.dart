import 'package:flutter/material.dart';

class SSRotateWidget extends StatefulWidget {
  final Widget child;
  final Duration duration; // 一圈所需时间
  final bool clockwise; // 是否顺时针
  final bool autoPlay; // 是否自动开始

  const SSRotateWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.clockwise = true,
    this.autoPlay = true,
  });

  @override
  State<SSRotateWidget> createState() => _SSRotateWidgetState();
}

class _SSRotateWidgetState extends State<SSRotateWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    if (widget.autoPlay) {
      _controller.repeat(); // 无限旋转
    }
  }

  /// 外部调用：开始旋转
  void start() => _controller.repeat();

  /// 外部调用：停止旋转
  void stop() => _controller.stop();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: widget.clockwise ? 1.0 : -1.0)
          .animate(_controller),
      child: widget.child,
    );
  }
}