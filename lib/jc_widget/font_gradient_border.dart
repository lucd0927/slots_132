import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSTxtGraBorder extends StatelessWidget {
  final Color? fontColor;
  final Gradient? gradient;
  final FontStyle? fontStyle;
  final double fontSize;
  final Color strokeColor;
  final double? height;
  final FontWeight fontWeight;
  final double strokeWidth;
  final String text;


  final bool showShadow;

  const SSTxtGraBorder({
    super.key,
    required this.text,
    this.gradient,
    this.fontSize = 14,
    this.strokeWidth = 2,
    this.fontWeight = FontWeight.bold,
    this.fontColor = Colors.white,
    this.height = 1,
    this.strokeColor = const Color(0xffFFFAD7),

    this.showShadow = false,
    this.fontStyle,

  });

  @override
  Widget build(BuildContext context) {
    var tmpGradient =
        gradient ??
            LinearGradient(
              colors: [
                Color(0xffFFF565),
                Color(0xffFFE0A7),
                Color(0xffFFFE10),
                Color(0xffFFF9AA),
                Color(0xffFDDE51),
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            );
    return Stack(
      children: [
        // 边框层
        Text(
          text,
          textAlign: TextAlign.center,

          style: TextStyle(
            shadows: showShadow
                ? [
              // Shadow(color: Colors.black,offset: Offset(2, 2),blurRadius: 5),
              Shadow(
                color: strokeColor,
                offset: Offset(-1.sp, 3.sp),
                blurRadius: 0,
              ),
              Shadow(
                color: strokeColor,
                offset: Offset(1.sp, 3.sp),
                blurRadius: 0,
              ),
            ]
                : null,
            fontWeight: fontWeight,
            height: height,
            fontSize: fontSize,
            fontStyle: fontStyle,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),

        ShaderMask(
          shaderCallback: (bounds) => tmpGradient.createShader(bounds),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontStyle: fontStyle,
              color: fontColor,
              fontWeight: fontWeight,
              height: height,
            ),
          ),
        ),

        // 渐变填充层
      ],
    );
  }
}
