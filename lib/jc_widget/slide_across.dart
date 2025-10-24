// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../gen/assets.gen.dart';
//
// enum EnumLocation { top, center, center2, bottom }
//
// class SlideAcrossOverlay {
//   OverlayEntry? _entry;
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//
//   void show(BuildContext context) {
//     final overlay = Overlay.of(context);
//     final ticker = Navigator.of(context);
//
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 3000), // 总时长：进入+停留+退出
//       vsync: ticker,
//     );
//
//     // 动画轨迹：
//     // 0% → 30%：右 → 中间（1s）
//     // 30% → 70%：保持中间（3s）
//     // 70% → 100%：中间 → 左（1s）
//     _animation = TweenSequence<Offset>([
//       TweenSequenceItem(
//         tween: Tween<Offset>(
//           begin: const Offset(1.0, 0.0), // 屏幕右外
//           end: Offset.zero, // 中间
//         ).chain(CurveTween(curve: Curves.linear)),
//         weight: 20,
//       ),
//       TweenSequenceItem(
//         tween: ConstantTween<Offset>(Offset.zero), // 停留不动
//         weight: 60,
//       ),
//       TweenSequenceItem(
//         tween: Tween<Offset>(
//           begin: Offset.zero,
//           end: const Offset(-1.0, 0.0), // 屏幕左外
//         ).chain(CurveTween(curve: Curves.linear)),
//         weight: 20,
//       ),
//     ]).animate(_controller);
//
//     EnumLocation location = EnumLocation.center;
//     int random = Random().nextInt(4);
//     if (random == 0) {
//       location = EnumLocation.top;
//     } else if (random == 1) {
//       location = EnumLocation.center;
//     } else if (random == 2) {
//       location = EnumLocation.center2;
//     } else if (random == 3) {
//       location = EnumLocation.bottom;
//     }
//     double top = 30;
//     if (location == EnumLocation.top) {
//       top = 100.h;
//     } else if (location == EnumLocation.center) {
//       top = 200.h;
//     } else if (location == EnumLocation.center2) {
//       top = 300.h;
//     } else if (location == EnumLocation.bottom) {
//       top = 500.h;
//     }
//
//     top = top*2;
//     String bank = "";
//     double money =100;
//
//     String id = "ID${Random().nextInt(10)}***${Random().nextInt(10)} ${"transfer received".tr} ";
//     _entry = OverlayEntry(
//       builder: (context) => IgnorePointer(
//         child: Stack(
//           children: [
//             Positioned(
//               top: top,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: SlideTransition(
//                   position: _animation,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: Center(
//                       child: Container(
//                         // height: 62.h,
//                         width: 348.w,
//                         padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.w),
//                           border: Border.all(
//                             color: Color(0xffAE6A42),
//                             width: 1.w,
//                           ),
//                           color: Color(0xffFAF0DA).withValues(alpha: 0.8),
//                           // color: Colors.white.withValues(alpha: 0.8),
//                         ),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               Assets.imgB.overlayCard.path,
//                               width: 30.h,
//                               height: 30.h,
//                             ),
//                             SizedBox(width: 12.w),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text.rich(
//                                     TextSpan(
//                                       text:
//                                       id,
//
//                                       children: [
//                                         TextSpan(
//                                           text:
//                                           "${Country.curCurrencySymbol()}${money}",
//                                           style: TextStyle(
//                                             color: Color(0xff00AB14),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 14.sp,
//                                       color: Color(0xff9F481D),
//                                     ),
//                                   ),
//                                   Text.rich(
//                                     TextSpan(text: "stepwin tecnologia ltda".tr),
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 12.sp,
//                                       color: Color(0xff9F481D),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(width: 12.w),
//                             Image.asset(bank, width: 40.h, height: 40.h),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//     overlay.insert(_entry!);
//     _controller.forward();
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         _remove();
//       }
//     });
//   }
//
//   void _remove() {
//     _controller.dispose();
//     _entry?.remove();
//     _entry = null;
//   }
// }
