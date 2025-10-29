import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSTxtGraBorder extends StatelessWidget {
  final Color? fontColor;
  final Gradient? gradient;
  final FontStyle? fontStyle;
  final double? fontSize;
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
    this.fontSize ,
    this.strokeWidth = 2,
    this.fontWeight = FontWeight.w400,
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
                Color(0xffFFD70F),
                Color(0xffF0A00D),
                Color(0xffEAFF00),
                Color(0xffFFD500),
                Color(0xffFDDE51),
              ],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            );

    double tmpfontSize = fontSize??14.sp;
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
            fontSize: tmpfontSize,
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
              fontSize: tmpfontSize,
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
