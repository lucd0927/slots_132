import 'package:flutter/material.dart';

class CheckImageReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CheckImageReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<CheckImageReveal> createState() => _CheckImageRevealState();
}

class _CheckImageRevealState extends State<CheckImageReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return ClipRect(
          child:FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _controller.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
