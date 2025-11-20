import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_common/sssssp/spine_lihua.dart';
import 'package:slots_132/ss_common/sssssp/spine_test.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayCommonGet {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required double money}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return CommonGetWidget(
          onBtn: (double money) {
            close();
          },
          money: money,
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class CommonGetWidget extends StatefulWidget {
  const CommonGetWidget({super.key, required this.onBtn, required this.money});

  final double money;
  final ValueChanged<double> onBtn;

  @override
  State<CommonGetWidget> createState() => _CommonGetWidgetState();
}

class _CommonGetWidgetState extends State<CommonGetWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnAudio.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.9;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });

      _timer = Timer(Duration(milliseconds: 2000), () {
        _timer?.cancel();
        onClose(1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _timer?.cancel();
        onClose(1);
      },
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: animD,
          color: Colors.black.withValues(alpha: showAnimated ? 0.2 : 0),
          child: Center(
            child: AnimatedScale(
              duration: animD,
              scale: showAnimated ? 1.0 : startScale,
              child: Container(
                width: double.infinity,
                height: double.infinity,

                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 200.h,
                      // bottom: 20,
                      // top: 0,
                      child: IgnorePointer(
                        child: Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().screenHeight,
                          child: SSSpineTest(),
                        ),
                      ),
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80.h),
                        Container(
                          width: 362.w,
                          height: 127.h,
                          decoration: BoxDecoration(
                            color: Color(0xff000000).withValues(alpha: 0.5),
                            border: Border.all(
                              color: Color(0xffFFDD00),
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                          child: Column(children: [

                          ],),
                        ),
                        SizedBox(height: 120.h),
                        Container(
                          width: 260.w,
                          height: 190.h,
                          decoration: BoxDecoration(
                            color: Color(0xff000000).withValues(alpha: 0.5),
                            border: Border.all(
                              color: Color(0xffFFDD00),
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(16.w),
                          ),
                        ),
                      ],
                    ),
                    // Positioned(
                    //   bottom: 200.h,
                    //   // bottom: 20,
                    //   // top: 0,
                    //   child: IgnorePointer(
                    //     child: Container(
                    //       width: ScreenUtil().screenWidth,
                    //       height: ScreenUtil().screenHeight,
                    //       child: SSSpineYanhua(),
                    //     ),
                    //   ),
                    // ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onClose(double money) async {
    ssLogggg("====== close money:$money");
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    // await Future.delayed(animD);
    widget.onBtn(money);
  }
}
