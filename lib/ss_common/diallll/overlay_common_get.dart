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
import 'package:slots_132/ss_common/sssssp/spine_money.dart';
import 'package:slots_132/ss_common/sssssp/spine_test.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayCommonGet {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({double? money, int? exp, int? phoneSpice}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      // opaque: true,
      builder: (context) {
        return CommonGetWidget(
          onBtn: (double money) {
            close();
          },
          money: money ?? 0.0,
          exp: exp ?? 0,
          phoneSpice: phoneSpice ?? 0,
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
  const CommonGetWidget({
    super.key,
    required this.onBtn,
    required this.money,
    required this.exp,
    required this.phoneSpice,
  });

  final double money;
  final int exp;
  final int phoneSpice;
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
        // onClose(1);
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
          color: Colors.black.withValues(alpha: showAnimated ? 0.3 : 0),
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
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80.h),
                        topWwww(),
                        SizedBox(height: 120.h),
                        centerWww(),
                      ],
                    ),

                    //
                    // Positioned(
                    //   left: -0.w,
                    //   right: -0.w,
                    //   top: -0.h,
                    //   bottom: 0,
                    //   child: IgnorePointer(
                    //     child: Center(
                    //       child: Container(
                    //         width: ScreenUtil().screenWidth,
                    //         height: ScreenUtil().screenHeight,
                    //         color: Colors.green.withValues(alpha: 0.2),
                    //         child: SSSpineMoney(),
                    //       ),
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

  Widget centerWww() {
    bool showMoney = widget.money > 0;
    bool showExp = widget.exp > 0;
    bool showPhone = widget.phoneSpice > 0;
    String img = Assets.img.moneyGift.path;
    if (showExp && showPhone) {
      img = Assets.img.phoneCardXuanguang.path;
    } else if (showExp) {
      img = Assets.img.popupGetXpmoney.path;
    } else if (showPhone) {
      img = Assets.img.popupGetPhonemoney.path;
    }
    return Container(
      width: 260.w,
      height: 190.h,
      decoration: BoxDecoration(
        color: Color(0xff000000).withValues(alpha: 0.5),
        border: Border.all(color: Color(0xffFFDD00), width: 2.w),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 10.h,
            child: Center(
              child: SSRotateWidget(
                child: Image.asset(
                  Assets.img.phoneCardXuanguang.path,
                  width: 260.w,
                  height: 190.h,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SSTxtBorder(
                text: "Get Cash",
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                fontColor: Color(0xffFFFF29),
                foreground: Color(0xffDB1717),
              ),
              SizedBox(height: 10.h),
              Image.asset(img, width: 200.w, height: 80.h),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showExp)
                    Row(
                      children: [
                        Image.asset(
                          Assets.img.mainTopXp.path,
                          width: 36.w,
                          height: 34.h,
                        ),
                        SizedBox(width: 4.w),
                        SSTxtBorder(
                          text: "+${widget.exp}",
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          fontColor: Color(0xffFFFF29),
                          foreground: Color(0xffDB1717),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  if (showMoney)
                    Row(
                      children: [
                        Image.asset(
                          Assets.img.popupGetPhoneSpice.path,
                          width: 36.w,
                          height: 34.h,
                        ),
                        SizedBox(width: 4.w),
                        SSTxtBorder(
                          text: "+${widget.phoneSpice}",
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          fontColor: Color(0xffFFFF29),
                          foreground: Color(0xffDB1717),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  SSTxtGraBorder(
                    text:
                        "+${SSCountry.curGuojiaFuhao()}${widget.money.toStringAsFixed(2)}",
                    fontSize: 20.sp,
                    fontFamily: FontFamily.alkatra,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff0FFF63),
                        Color(0xffA4F00D),
                        Color(0xffD0FF00),
                        Color(0xff00FF1E),
                        // Color(0xff0FFF63),
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                    strokeColor: Color(0xff0C402B),
                    strokeWidth: 3.w,
                    // fontColor: Color(0xff6AFF00),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget topWwww() {
    return Container(
      width: 362.w,
      height: 127.h,
      decoration: BoxDecoration(
        color: Color(0xff000000).withValues(alpha: 0.5),
        border: Border.all(color: Color(0xffFFDD00), width: 2.w),
        borderRadius: BorderRadius.circular(16.w),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "My cash",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(Assets.img.money.path, width: 30.w, height: 30.w),
              SizedBox(width: 8.w),
              SSTxtGraBorder(
                text:
                    "${SSCountry.curGuojiaFuhao()}${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
                fontSize: 16.sp,
                // fontFamily: FontFamily.alkatra,
                height: 1,
                fontWeight: FontWeight.w500,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff0FFF63),
                    Color(0xffA4F00D),
                    Color(0xffD0FF00),
                    Color(0xff00FF1E),
                    // Color(0xff0FFF63),
                  ],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
                strokeColor: Color(0xff0C402B),
                strokeWidth: 3.w,
                // fontColor: Color(0xff6AFF00),
              ),
            ],
          ),
          SizedBox(height: 2.h),

          Row(
            children: [
              Text(
                "My",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(Assets.img.mainTopXp.path, width: 30.w, height: 30.w),
              SizedBox(width: 8.w),
              SSTxtGraBorder(
                text:
                    "${MainController.to.curLevelExp.value.toStringAsFixed(0)}",
                fontSize: 16.sp,
                // fontFamily: FontFamily.alkatra,
                height: 1,
                fontWeight: FontWeight.w500,
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xff0FFF63),
                //     Color(0xffA4F00D),
                //     Color(0xffD0FF00),
                //     Color(0xff00FF1E),
                //     // Color(0xff0FFF63),
                //   ],
                //   end: Alignment.bottomCenter,
                //   begin: Alignment.topCenter,
                // ),
                strokeColor: Color(0xff0C402B),
                strokeWidth: 3.w,
                // fontColor: Color(0xff6AFF00),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text(
                "My",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Image.asset(
                Assets.img.popupGetPhoneSpice.path,
                width: 30.w,
                height: 30.w,
              ),
              SizedBox(width: 8.w),
              SSTxtGraBorder(
                text: "${PhoneCardController.to.collectCardNum.value}",
                fontSize: 16.sp,
                // fontFamily: FontFamily.alkatra,
                height: 1,
                fontWeight: FontWeight.w500,
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xff0FFF63),
                //     Color(0xffA4F00D),
                //     Color(0xffD0FF00),
                //     Color(0xff00FF1E),
                //     // Color(0xff0FFF63),
                //   ],
                //   end: Alignment.bottomCenter,
                //   begin: Alignment.topCenter,
                // ),
                strokeColor: Color(0xff0C402B),
                strokeWidth: 3.w,
                // fontColor: Color(0xff6AFF00),
              ),
            ],
          ),
        ],
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
