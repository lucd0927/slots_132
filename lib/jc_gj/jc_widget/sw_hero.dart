// import 'dart:math';
// import 'package:flutter/material.dart';
//
// /// 配置项：每个图片的目标位置、大小、内容
// class FlyImageItem {
//   final Widget child;
//   final Offset targetOffset;
//   final Size targetSize;
//
//   FlyImageItem({
//     required this.child,
//     required this.targetOffset,
//     required this.targetSize,
//   });
// }
//
// /// 使用：FlyingImageAnimation(items: [...])
// class FlyingImageAnimation extends StatefulWidget {
//   final List<FlyImageItem> items;
//   final Size startSize;
//   final Duration duration;
//   final VoidCallback? onComplete;
//
//   const FlyingImageAnimation({
//     super.key,
//     required this.items,
//     this.startSize = const Size(40, 40),
//     this.duration = const Duration(milliseconds: 1000),
//     this.onComplete,
//   });
//
//   @override
//   State<FlyingImageAnimation> createState() => _FlyingImageAnimationState();
// }
//
// class _FlyingImageAnimationState extends State<FlyingImageAnimation>
//     with TickerProviderStateMixin {
//   late final List<AnimationController> _controllers;
//   late final Size screenSize;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controllers = widget.items.map((_) {
//       return AnimationController(
//         vsync: this,
//         duration: widget.duration,
//       );
//     }).toList();
//
//     // 播放所有动画
//     for (final ctrl in _controllers) {
//       ctrl.forward();
//     }
//
//     // 等最后一个动画完成后触发回调
//     final last = _controllers.isNotEmpty ? _controllers.last : null;
//     last?.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         widget.onComplete?.call();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     for (final ctrl in _controllers) {
//       ctrl.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     screenSize = MediaQuery.of(context).size;
//     final center = Offset(screenSize.width / 2, screenSize.height / 2);
//
//     return Stack(
//       children: List.generate(widget.items.length, (i) {
//         final item = widget.items[i];
//         final controller = _controllers[i];
//         return _FlyAnimatedItem(
//           controller: controller,
//           child: item.child,
//           startPosition: center,
//           endPosition: item.targetOffset,
//           startSize: widget.startSize,
//           endSize: item.targetSize,
//         );
//       }),
//     );
//   }
// }
//
// /// 单个动画图片项
// class _FlyAnimatedItem extends StatelessWidget {
//   final AnimationController controller;
//   final Widget child;
//   final Offset startPosition;
//   final Offset endPosition;
//   final Size startSize;
//   final Size endSize;
//
//   const _FlyAnimatedItem({
//     required this.controller,
//     required this.child,
//     required this.startPosition,
//     required this.endPosition,
//     required this.startSize,
//     required this.endSize,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final positionTween =
//     Tween<Offset>(begin: startPosition, end: endPosition).chain(
//       CurveTween(curve: Curves.easeInOut),
//     );
//     final sizeTween = Tween<Size>(begin: startSize, end: endSize).chain(
//       CurveTween(curve: Curves.easeInOut),
//     );
//
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (_, __) {
//         final pos = positionTween.evaluate(controller);
//         final size = sizeTween.evaluate(controller);
//
//         return Positioned(
//           left: pos.dx - size.width / 2,
//           top: pos.dy - size.height / 2,
//           width: size.width,
//           height: size.height,
//           child: child,
//         );
//       },
//     );
//   }
// }
