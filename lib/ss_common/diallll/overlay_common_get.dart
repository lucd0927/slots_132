import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/hero_fly/hero_fly.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/jc_widget/toggle_switch.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/diallll/btn_beisu.dart';
import 'package:slots_132/ss_common/sssssp/spine_xiaozhuanpan.dart';
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

  void show({
    double? money,
    int? exp,
    int? phoneSpice,
    int? freespins,
    required VoidCallback onClose,
  }) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      // opaque: true,
      builder: (context) {
        return CommonGetWidget(
          onBtn: (double money) {
            close();
            ssLogggg("=====CommonGetWidget=close");
            onClose();




          },
          money: money ?? 0.0,
          exp: exp ?? 0,
          phoneSpice: phoneSpice ?? 0,
          freespins: freespins ?? 0,
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
    required this.freespins,
  });

  final double money;
  final int exp;
  final int phoneSpice;
  final int freespins;
  final ValueChanged<double> onBtn;

  @override
  State<CommonGetWidget> createState() => _CommonGetWidgetState();
}

class _CommonGetWidgetState extends State<CommonGetWidget> {
  bool positive = bgMusic.hasOn;
  bool positive2 = btnJackpot.hasOn;
  var green = Color(0xFF45CC0D);

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.9;
  Timer? _timer;

  BuildContext? moneyContext;
  BuildContext? xpContext;
  BuildContext? phoneContext;
  BuildContext? childContext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        showAnimated = true;
      });

      Future.delayed(animD, () {
        if (mounted) {
          if (childContext != null &&
              (moneyContext != null ||
                  xpContext != null ||
                  phoneContext != null)) {
            BuildContext? context = moneyContext;
            String icon = Assets.img.money.path;
            bool showMoney = widget.money > 0;
            bool showExp = widget.exp > 0;
            bool showPhone = widget.phoneSpice > 0;
            bool freespins = widget.freespins > 0;
            ssLogggg("========showMoney:$showMoney showExp:$showExp showPhone:$showPhone freespins:$freespins");
            if (showMoney) {
              icon = Assets.img.money.path;
              context = moneyContext;
            } else if (showExp) {
              icon = Assets.img.mainTopXp.path;
              context = xpContext;
            } else if (showPhone) {
              icon = Assets.img.popupGetPhoneSpice.path;
              context = phoneContext;
            }else if(freespins){
              Navigator.maybePop(Get.context!);
              onClose(1);
              MainController.to.curShowFreeSpin.value = true;
              MainController.to.curFreeSpinCount.value = widget.freespins;
              SSEventReporttttt.free_spin_add_chance();
              MainController.to.onFreeSpin();

              return;
            }
            if (mounted) {


              OverlayFly2TargetKey().show(
                targetContext: context!,
                childContext:childContext!,
                count: 5,
                heroChild: Image.asset(icon),
                onEnd: () {
                  _onClcc();
                },
              );
            } else {
              _onClcc();
            }
          } else {
            _onClcc();
          }
        }
      });
    });
  }

  _onClcc() {

    bool showMoney = widget.money > 0;
    bool showExp = widget.exp > 0;
    bool showPhone = widget.phoneSpice > 0;

    if(showMoney){
      MainController.to.onAddMoney(widget.money, showMoneyAnimated: false);
    }else if(showExp){
      MainController.to.onAddExp(widget.exp);
    }else if(showPhone){
      PhoneCardController.to.changeWhichStageIndex();
    }

    _timer = Timer(Duration(milliseconds: 1500), () {
      _timer?.cancel();
      onClose(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _timer?.cancel();
        // onClose(1);
      },
      child: Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: animD,
          color: Colors.black.withValues(alpha: showAnimated ? 0.4 : 0),
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
                    // Positioned(
                    //   left: -0.w,
                    //   right: -0.w,
                    //   top: 0.h,
                    //   bottom: -0.h,
                    //   child: IgnorePointer(
                    //     child: Center(
                    //       child: Container(
                    //         width: ScreenUtil().screenWidth,
                    //         height: ScreenUtil().screenHeight,
                    //         // width: 375.w,
                    //         // height: 812.h,
                    //         color: Colors.yellow.withValues(alpha: 0.0),
                    //         child: SSSpineMoney(),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80.h),
                        topWwww(),
                        SizedBox(height: 120.h),
                        centerWww(),
                      ],
                    ),
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
    bool freespins = widget.freespins > 0;
    String img = Assets.img.moneyGift.path;
    // showExp = true;
    if (showExp && showPhone) {
      img = Assets.img.phoneCardXuanguang.path;
    } else if (showExp) {
      img = Assets.img.mainTopXp.path;
    } else if (showPhone) {
      img = Assets.img.popupGetPhoneSpice.path;
    } else if (freespins) {
      img = Assets.img.popupGetFreespinmoney.path;
    }
    ssLogggg("=====showExp:$showExp showPhone:$showPhone img:$img");
    return Container(
      width: 270.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Color(0xffffffff).withValues(alpha: 1),
        // border: Border.all(color: Color(0xffFFDD00), width: 2.w),
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
                fontSize: 20.sp,
                fontColor: Color(0xffFFFF29),
                foreground: Color(0xffDB1717),
              ),
              SizedBox(height: 16.h),
              Builder(
                builder: (context) {
                  childContext = context;
                  return Image.asset(img, width: 200.w, height: 80.h);
                },
              ),
              SizedBox(height: 16.h),
              Container(
                color: Colors.blueAccent.withValues(alpha: 0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (showExp)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   Assets.img.mainTopXp.path,
                            //   width: 36.w,
                            //   height: 34.h,
                            // ),
                            // SizedBox(width: 4.w),
                            SSTxtBorder(
                              text: "+${widget.exp}",
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              fontColor: Color(0xffFFFF29),
                              foreground: Color(0xffDB1717),
                            ),
                            // SizedBox(width: 10.w),
                          ],
                        ),
                      if (showPhone)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   Assets.img.popupGetPhoneSpice.path,
                            //   width: 36.w,
                            //   height: 34.h,
                            // ),
                            // SizedBox(width: 4.w),
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
                      if (freespins)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   Assets.img.popupGetFreespinmoneyS.path,
                            //   width: 36.w,
                            //   height: 34.h,
                            // ),
                            // SizedBox(width: 4.w),
                            SSTxtBorder(
                              text: "+${widget.freespins}",
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              fontColor: Color(0xffFFFF29),
                              foreground: Color(0xffDB1717),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      if (showMoney)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.h),
                            SSTxtGraBorder(
                              text:
                                  "+${SSCountry.curGuojiaFuhao()}${widget.money.toStringAsFixed(2)}",
                              fontSize: 20.sp,
                              fontFamily: FontFamily.ghostKidAOEPro,
                              height: 1.2,
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
                ),
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
        color: Color(0xffffffff).withValues(alpha: 1),
        // border: Border.all(color: Color(0xffFFDD00), width: 2.w),
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
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Builder(
                builder: (context) {
                  moneyContext = context;
                  return Image.asset(
                    Assets.img.money.path,
                    width: 30.w,
                    height: 30.w,
                  );
                },
              ),
              SizedBox(width: 8.w),

              SSAniiiiCount(
                fractionDigits: 2,
                // value: MainController.to.curSpinMoney.value,
                value: MainController.to.curMonnnn.value,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6AFF00),
                  fontFamily: FontFamily.ghostKidAOEPro,
                ),
                prefix: SSCountry.curGuojiaFuhao(),
              ),

              // SSTxtGraBorder(
              //   text:
              //       "${SSCountry.curGuojiaFuhao()}${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
              //   fontSize: 16.sp,
              //   // fontFamily: FontFamily.alkatra,
              //   height: 1,
              //   fontWeight: FontWeight.w500,
              //   gradient: LinearGradient(
              //     colors: [
              //       Color(0xff0FFF63),
              //       Color(0xffA4F00D),
              //       Color(0xffD0FF00),
              //       Color(0xff00FF1E),
              //       // Color(0xff0FFF63),
              //     ],
              //     end: Alignment.bottomCenter,
              //     begin: Alignment.topCenter,
              //   ),
              //   strokeColor: Color(0xff0C402B),
              //   strokeWidth: 3.w,
              //   // fontColor: Color(0xff6AFF00),
              // ),
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
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Builder(
                builder: (context) {
                  xpContext = context;
                  return Image.asset(
                    Assets.img.mainTopXp.path,
                    width: 30.w,
                    height: 30.w,
                  );
                },
              ),
              SizedBox(width: 8.w),

              SSAniiiiCount(
                fractionDigits: 0,
                // value: MainController.to.curSpinMoney.value,
                value: MainController.to.curLevelExp.value,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffCB4B06),
                  fontFamily: FontFamily.ghostKidAOEPro,
                ),
                prefix: "",
              ),

              // SSTxtGraBorder(
              //   text:
              //       "${MainController.to.curLevelExp.value.toStringAsFixed(0)}",
              //   fontSize: 16.sp,
              //   // fontFamily: FontFamily.alkatra,
              //   height: 1,
              //   fontWeight: FontWeight.w500,
              //   // gradient: LinearGradient(
              //   //   colors: [
              //   //     Color(0xff0FFF63),
              //   //     Color(0xffA4F00D),
              //   //     Color(0xffD0FF00),
              //   //     Color(0xff00FF1E),
              //   //     // Color(0xff0FFF63),
              //   //   ],
              //   //   end: Alignment.bottomCenter,
              //   //   begin: Alignment.topCenter,
              //   // ),
              //   strokeColor: Color(0xff0C402B),
              //   strokeWidth: 3.w,
              //   // fontColor: Color(0xff6AFF00),
              // ),
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
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Builder(
                builder: (context) {
                  phoneContext = context;
                  return Image.asset(
                    Assets.img.popupGetPhoneSpice.path,
                    width: 30.w,
                    height: 30.w,
                  );
                },
              ),
              SizedBox(width: 8.w),

              SSAniiiiCount(
                fractionDigits: 0,
                // value: MainController.to.curSpinMoney.value,
                value: PhoneCardController.to.collectCardNum.value,
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffCB4B06),
                  fontFamily: FontFamily.ghostKidAOEPro,
                ),
                prefix: "",
              ),

              // SSTxtGraBorder(
              //   text: "${PhoneCardController.to.collectCardNum.value}",
              //   fontSize: 16.sp,
              //   // fontFamily: FontFamily.alkatra,
              //   fontFamily: FontFamily.ghostKidAOEPro,
              //   height: 1,
              //   fontWeight: FontWeight.w500,
              //   // gradient: LinearGradient(
              //   //   colors: [
              //   //     Color(0xff0FFF63),
              //   //     Color(0xffA4F00D),
              //   //     Color(0xffD0FF00),
              //   //     Color(0xff00FF1E),
              //   //     // Color(0xff0FFF63),
              //   //   ],
              //   //   end: Alignment.bottomCenter,
              //   //   begin: Alignment.topCenter,
              //   // ),
              //   strokeColor: Color(0xff0C402B),
              //   strokeWidth: 3.w,
              //   // fontColor: Color(0xff6AFF00),
              // ),
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
