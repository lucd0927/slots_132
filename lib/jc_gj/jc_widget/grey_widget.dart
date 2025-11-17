import 'package:flutter/material.dart';

class GreyWidget extends StatelessWidget {
  const GreyWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const _greyMatrix = <double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(_greyMatrix),
      child: child,
    );
  }
}
