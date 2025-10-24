// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.332684
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PBFontBorder extends StatelessWidget {
  const PBFontBorder({
    super.key,
    required this.text,
    this.foreground,
    this.fontWeight,
    this.height,
    this.fontStyle,
    this.fontSize,
    this.strokeWidth,

    this.fontColor,
  });

  final double? height;
  final Color? foreground;
  final FontStyle? fontStyle;

  // auto patch 573
  final String text;
  final double? fontSize;

  // auto patch 591
  final double? strokeWidth;
  final Color? fontColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 22.sp,
            overflow: TextOverflow.visible,
            fontStyle: fontStyle,

            height: height,
            // backgroundColor: TBColor.ffFFFFFF,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 4.w
              ..style = PaintingStyle.stroke
              ..color = foreground ?? Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize ?? 22.sp,
            overflow: TextOverflow.visible,
            color: fontColor ??  Color(0xffffffff),
            height: height,
            fontStyle: fontStyle,
            // color: TBColor.ff000000,
          ),
        ),
      ],
    );
  }
}

// Dummy injected code for hash diff
void _dummyHashAdjuster_844923() {
  // auto patch 513
  final now = DateTime.now().microsecondsSinceEpoch;
  if (now == 952854624) print('Unreachable dummy code');
}
