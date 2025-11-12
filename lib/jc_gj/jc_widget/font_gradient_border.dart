import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SSTxtGraBorder extends StatelessWidget {
  final Color? fontColor;
  final Gradient? gradient;
  final FontStyle? fontStyle;
  final double? fontSize;
  final Color strokeColor;
  final Color? shadowColor;
  final double? height;
  final FontWeight fontWeight;
  final double strokeWidth;
  final String text;
  final String? fontFamily;

  final bool showShadow;

  const SSTxtGraBorder({
    super.key,
    required this.text,
    this.gradient,
    this.fontSize,
    this.strokeWidth = 1,
    this.fontWeight = FontWeight.w400,
    this.fontColor = Colors.white,
    this.height = 1,
    this.strokeColor = const Color(0xffFFFAD7),

    this.showShadow = false,
    this.fontStyle,
    this.fontFamily, this.shadowColor,
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

    double tmpfontSize = fontSize ?? 14.sp;
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
                      color: shadowColor??strokeColor,
                      offset: Offset(-1.sp, 2.sp),
                      blurRadius: 0,
                    ),
                    Shadow(
                      color:  shadowColor??strokeColor,
                      offset: Offset(1.sp, 2.sp),
                      blurRadius: 20,
                    ),
                  ]
                : null,
            fontWeight: fontWeight,
            height: height,
            fontSize: tmpfontSize,
            fontStyle: fontStyle,
            fontFamily: fontFamily,
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
              fontFamily: fontFamily,
              height: height,
            ),
          ),
        ),

        // 渐变填充层
      ],
    );
  }
}
