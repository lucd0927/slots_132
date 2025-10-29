// import 'package:flutter/material.dart';
//
// class GlowingBorder extends StatefulWidget {
//   final Widget child;
//   final double borderWidth;
//   final List<Color> colors;
//   final double radius;
//   final Duration duration;
//   final bool animate;
//   final EdgeInsets padding;
//
//   const GlowingBorder({
//     super.key,
//     required this.child,
//     this.borderWidth = 3.0,
//     this.colors = const [Colors.blue, Colors.purple, Colors.pink],
//     this.radius = 12.0,
//     this.duration = const Duration(seconds: 3),
//     this.animate = true,
//     this.padding = const EdgeInsets.all(3),
//   });
//
//   @override
//   State<GlowingBorder> createState() => _GlowingBorderState();
// }
//
// class _GlowingBorderState extends State<GlowingBorder>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: widget.duration);
//
//     if (widget.animate) _controller.repeat();
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
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, _) {
//         final double shift = widget.animate ? _controller.value * 360 : 0;
//         return CustomPaint(
//           painter: _GradientBorderPainter(
//             colors: widget.colors,
//             borderWidth: widget.borderWidth,
//             radius: widget.radius,
//             shiftDegrees: shift,
//           ),
//           child: Padding(
//             padding: widget.padding,
//             child: widget.child,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _GradientBorderPainter extends CustomPainter {
//   final List<Color> colors;
//   final double borderWidth;
//   final double radius;
//   final double shiftDegrees;
//
//   _GradientBorderPainter({
//     required this.colors,
//     required this.borderWidth,
//     required this.radius,
//     required this.shiftDegrees,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size;
//
//     // 动态旋转渐变
//     final Gradient gradient = SweepGradient(
//       startAngle: 0,
//       endAngle: 6.28319, // 2π
//       colors: colors,
//       transform: GradientRotation(shiftDegrees * 3.14159 / 180),
//     );
//
//     final Paint paint = Paint()
//       ..shader = gradient.createShader(rect)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = borderWidth
//       ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 1); // 发光
//
//     final RRect rrect =
//     RRect.fromRectAndRadius(rect.deflate(borderWidth / 2), Radius.circular(radius));
//
//     canvas.drawRRect(rrect, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) =>
//       oldDelegate.shiftDegrees != shiftDegrees ||
//           oldDelegate.colors != colors ||
//           oldDelegate.borderWidth != borderWidth ||
//           oldDelegate.radius != radius;
// }
