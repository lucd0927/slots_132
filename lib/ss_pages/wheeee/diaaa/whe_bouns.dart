
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';

class WheBouns extends StatefulWidget {
  const WheBouns({super.key});

  @override
  State<WheBouns> createState() => _WheBounsState();
}

class _WheBounsState extends State<WheBouns> {
  @override
  Widget build(BuildContext context) {
    Widget child =  Container(
      width: double.infinity,
      height: 235.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            Assets.img.wheelZpBottomBg.path,
            width: double.infinity,
            height: 235.w,
            fit: BoxFit.fill,
          ),

          // Positioned(child: child)
        ],
      ),
    );
    return Material(
      color: Colors.transparent,
      child: child,);
    return Scaffold(body: child,);
  }
}
