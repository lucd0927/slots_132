import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';

class AnimatedXuanguang extends StatelessWidget {
  const AnimatedXuanguang({super.key});

  @override
  Widget build(BuildContext context) {
    return SSRotateWidget(
      duration: Duration(milliseconds: 30000),
      child: _AnimatedXuanguang(),
    );
  }
}

class _AnimatedXuanguang extends StatefulWidget {
  const _AnimatedXuanguang({super.key});

  @override
  State<_AnimatedXuanguang> createState() => _AnimatedXuanguangState();
}

class _AnimatedXuanguangState extends State<_AnimatedXuanguang> {
  bool showFirst = false;
  Timer? timer;
  int curIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (t) {
      setState(() {
        showFirst = !showFirst;
        if (showFirst) {
          curIndex = 1;
        } else {
          curIndex = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: Stack(
        // index: curIndex,
        children: [
          SSAScale(
            maxS: 1.4,
            minS: 0.9,
            milliseconds: 500,
            child: Image.asset(
              Assets.mya.xuanguang.xuanguang1.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              gaplessPlayback: true,
            ),
          ),
          // if (curIndex == 1 )
            SSAScale(
              maxS: 1.4,
              minS: 0.9,
              milliseconds: 1000,
              child: Image.asset(
                Assets.mya.xuanguang.xuanguang2.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                gaplessPlayback: true,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }
}
