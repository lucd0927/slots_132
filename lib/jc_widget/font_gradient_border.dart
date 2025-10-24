import 'package:flutter/material.dart';

class PBGradientBorderText extends StatelessWidget {

  final Color? fontColor;
  final Gradient? gradient;

  final double? height;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final double strokeWidth;
  final String text;
  final double fontSize;
  final Color strokeColor;

  const PBGradientBorderText({
    super.key,
    required this.text,
    this.gradient,
    this.fontSize = 30,
    this.strokeColor = const Color(0xffFFFAD7),
    this.strokeWidth = 2,
    this.fontWeight = FontWeight.bold,
    this.fontStyle,
    this.fontColor = Colors.white,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    var tmpGradient =
        gradient ??
        LinearGradient(
          colors: [
            Color(0xffFFFA65),
            Color(0xffFFED59),
            Color(0xffFA820D),
            Color(0xffFCFFD0),
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
