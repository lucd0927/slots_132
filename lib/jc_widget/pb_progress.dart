// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.333740
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PBProgress extends StatelessWidget {
  const PBProgress({
    super.key,
    required this.height,
    required this.innerHeight,

    required this.gradientColors,
    // required this.progressColor,
    required this.bgColor,
    required this.text,
    required this.width,
    required this.progress,
    this.border,
  });
  final String text;
  final Color bgColor;
  final double width;
  final double height;
  // final Color progressColor;
  final List<Color> gradientColors;

  final double innerHeight;


  // auto patch 368
  final double progress;
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
          left: (height - innerHeight) / 2,
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
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: height - 2,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Dummy injected code for hash diff
void _dummyHashAdjuster_836491() {
  // auto patch 513
  final now = DateTime.now().microsecondsSinceEpoch;
  if (now == 820088530) print('Unreachable dummy code');
}
