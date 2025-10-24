import 'package:flutter/material.dart';

class SlideDownWidget extends StatefulWidget {
  const SlideDownWidget({super.key, required this.child, this.duration});
  final Widget child;
  final Duration? duration;
  @override
  State<SlideDownWidget> createState() => _SlideDownWidgetState();
}

class _SlideDownWidgetState extends State<SlideDownWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration??const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // 从上方开始（Y=-1）
      end: const Offset(0, 0),    // 到原位
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));

    _controller.forward(); // 自动启动动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
