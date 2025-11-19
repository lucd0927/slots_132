import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus_controller.dart';
import 'package:slots_132/ss_pages/lucky_slots/lucky_slots_controller.dart';
import 'package:slots_132/ss_pages/lucky_slots/viewwww/slot_machine_lucky.dart';
OverlayLuckySlots overlayLuckySlots = OverlayLuckySlots();
class OverlayLuckySlots {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    close();
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return LuckySlotsWidget(
          onClose: () {
            close();
          },
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

class LuckySlotsWidget extends StatefulWidget {
  const LuckySlotsWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<LuckySlotsWidget> createState() => _LuckySlotsWidgetState();
}

class _LuckySlotsWidgetState extends State<LuckySlotsWidget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(LuckySlotsController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        LuckySlotsController.to.onStartRoller();
      },
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: animD,
          color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent.withValues(alpha: 0.0),
            child: Stack(
              children: [
                // Image.asset(
                //   Assets.img.bonusGameBg.path,
                //   width: double.infinity,
                //   height: double.infinity,
                //   fit: BoxFit.fill,
                // ),
                AnimatedScale(
                  duration: animD,
                  // offset: showAnimated ? Offset.zero : Offset(0, 1),
                  scale: showAnimated ? 1.0 : 0.8,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.blueAccent.withValues(alpha: 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        topWidget(),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SSTxtBorder(
                              text: "WIN UP TO MAX ",
                              fontSize: 24.sp,
                              fontColor: Color(0xffFFEA00),
                            ),
                            SSTxtBorder(
                              text: "\$99.9",
                              fontSize: 24.sp,
                              fontColor: Color(0xff00FF1E),
                            ),
                          ],
                        ),

                        centerWidget(),

                        SizedBox(height: 80.h),
                      ],
                    ),
                  ),
                ),

                // closeWidget(),
              ],
            ),
          ),
        ),
      ),
    );
    return Obx(() {});
  }

  closeWidget() {
    return Positioned(
      top: 50.h,
      left: 20.w,
      child: GestureDetector(
        onTap: onClose,
        child: Image.asset(
          Assets.img.btnBack.path,
          width: 42.w,
          height: 27.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("====== close");

    widget.onClose();
  }

  topWidget() {
    return Container(
      width: 333.h,
      height: 165.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.luckySlotsTitle.path,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<LuckySlotsController>();
    super.dispose();
  }

  centerWidget() {
    return Container(
      width: 325.w,
      height: 232.w,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.luckySlotsSlots.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Positioned.fill(
            left: 20.w,
            right: 20.w,
            top: 44.h,
            bottom: 44.h,
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                // color: Colors.red.withValues(alpha: 0.5),
                child: slotsMachine(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  slotsMachine() {
    return SSSlotMachineLucky();
  }
}
