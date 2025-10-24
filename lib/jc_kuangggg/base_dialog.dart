import 'package:flutter/material.dart';

showBaseDialog({
  required BuildContext context,
  required Widget child,
  Color? barrierColor,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    useSafeArea: false,
    animationStyle: AnimationStyle(
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    ),
    barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.6),

    builder: (context) {
      return SafeArea(
        top: false,
        bottom: false,
        child: NotBack(
          child: Material(color: Colors.transparent, child: child),
        ),
      );
    },
  );
}

class NotBack extends StatelessWidget {
  const NotBack({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false, child: child);
  }
}
