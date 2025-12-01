import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSProjjjj extends StatelessWidget {
  const SSProjjjj({
    super.key,
    required this.height,
    required this.innerHeight,
    required this.width,
    required this.progress,
    required this.gradientColors,
    required this.bgColor,
    this.border,
    this.text,
  });

  final String? text;
  final Color bgColor;
  final double height;
  final List<Color> gradientColors;
  final double innerHeight;
  final double progress;
  final double width;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(
          height
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: bgColor,
              border: border,
              borderRadius: BorderRadius.circular(height),
            ),
          ),
          Positioned(
            right: (height - innerHeight) / 2,
            left: progress<0.1?0:(height - innerHeight) / 2,
            bottom: 0.h,
            top: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: innerHeight,
                width: width * progress,
                decoration: BoxDecoration(
                  // color: progressColor,
                  gradient: LinearGradient(
                    colors: gradientColors,
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(innerHeight),
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            top: 0,
            bottom: 0.h,
            right: 0,
            child: Center(
              child: Text(
                text ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height - 2,
                  height: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
