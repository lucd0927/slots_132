import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text_plus/auto_size_text_plus.dart';
class SSTxtBorder extends StatelessWidget {
  const SSTxtBorder({
    super.key,
    required this.text,
    this.fontWeight,
    this.height,
    this.fontSize,
    this.strokeWidth,
    this.foreground,

    this.fontColor,
    this.fontStyle,

  });
  final FontStyle? fontStyle;

  final String text;
  final double? height;

  final double? fontSize;

  final double? strokeWidth;
  final Color? fontColor;
  final Color? foreground;

  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AutoSizeText(
          text,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 16.sp,
            overflow: TextOverflow.visible,
            fontStyle: fontStyle,

            height: height??1,
            // backgroundColor: TBColor.ffFFFFFF,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 2.w
              ..style = PaintingStyle.stroke
              ..color = foreground ?? Colors.black,
          ),
          textAlign: TextAlign.center,
          minFontSize: 7.sp,
          stepGranularity: 7.sp,
        ),
        AutoSizeText(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            // fontFamily: FontFamily.made,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: fontSize ?? 16.sp,
            overflow: TextOverflow.visible,
            color: fontColor ??  Color(0xffffffff),
            height: height??1,
            fontStyle: fontStyle,
            // color: TBColor.ff000000,
          ),
          minFontSize: 7.sp,
          stepGranularity: 7.sp,
        ),
      ],
    );
  }
}
