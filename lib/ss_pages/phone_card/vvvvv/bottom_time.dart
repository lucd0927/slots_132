import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';

class PhoneBottomTime extends StatefulWidget {
  const PhoneBottomTime({super.key});

  @override
  State<PhoneBottomTime> createState() => _PhoneBottomTimeState();
}

class _PhoneBottomTimeState extends State<PhoneBottomTime> {
  bool canClickClaim = false;

  Timer? _timer;

  var box = SSHive.box;
  final List<Duration> durations = [
    const Duration(seconds: 24),
    const Duration(seconds: 24),
    const Duration(seconds: 24),
    const Duration(seconds: 48),
    const Duration(seconds: 72),
    const Duration(seconds: 120),
    const Duration(seconds: 168),
    const Duration(seconds: 336),
    const Duration(seconds: 24),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var clickIndex = box.get(hkCurTime);
    if (clickIndex == null) {
      canClickClaim = true;
    }

    if (!canClickClaim) {
      initTimer();
    }
  }

  resetCurTime() {
    box.delete(hkCurTime);
    canClickClaim = true;
    shengyuTime = 0;
    _timer?.cancel();
  }

  int get whichStageTime {
    int index = box.get(hkTimeIndex) ?? 0;
    int tmpDiff = durations[index].inSeconds;
    // ssLogggg("=====index:$index= time:$tmpDiff===");
    return tmpDiff;
  }

  void changeWhichStageIndex() {
    int? index = box.get(hkTimeIndex);
    if (index == null) {
      index = 0;
    } else {
      index++;
    }

    if (index >= durations.length) {
      index = 0;
    }
    ssLogggg("===changeWhichStageIndex:$index");
    box.put(hkTimeIndex, index);
  }

  String hkCurTime = "dgdsfg23421";
  String hkTimeIndex = "5aetsfgdsg";

  int curSecondSinceEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  int shengyuTime = 0;

  initTimer() {
    int? time = box.get(hkCurTime);
    // time = null;
    if (time == null) {
      time = curSecondSinceEpoch();
      box.put(hkCurTime, time);
      shengyuTime = whichStageTime;
    } else {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time;
      shengyuTime = whichStageTime - tmpDiff;
    }

    // ssLogggg("=init shengyuTime:$shengyuTime===");
    _timer = Timer.periodic(Duration(seconds: 1), (tmpTimer) {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time!;
      shengyuTime = whichStageTime - tmpDiff;
      // ssLogggg("=shengyuTime:$shengyuTime===");
      setState(() {});
      if (shengyuTime < 0) {
        resetCurTime();
        return;
      }
      box.put(hkCurTime, time);
    });
  }

  String toTime() {
    if (shengyuTime <= 0) {
      return "00:00:00";
    }
    final duration = Duration(seconds: shengyuTime);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    final formatted = "$hours:$minutes:$secs";
    return formatted;
  }

  onclickClaim() {
    ssLogggg("=====onclickClaim===canClickClaim:$canClickClaim==");
    if (!canClickClaim) {
      return;
    }

    canClickClaim = false;
    changeWhichStageIndex();
    initTimer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onclickClaim,
          child: Container(
            width: 277.h,
            height: 48.h,
            child: Stack(
              children: [
                Image.asset(
                  canClickClaim
                      ? Assets.img.btnWheel.path
                      : Assets.img.btnPhoneClick.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: SSTxtBorder(
                    text: "Claim Today’s Piece",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    fontFamily: FontFamily.alkatra,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        _BottomTime(),
      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _BottomTime() {
    return Container(
      width: 280.w,
      height: 30.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.phoneCardBottomBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: SSTxtGraBorder(
              text: "Ready in:  [ ${toTime()} ]",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              fontFamily: FontFamily.sansitaOne,
            ),
          ),
        ],
      ),
    );
  }
}
