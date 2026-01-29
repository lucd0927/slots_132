import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayPhoneInputName {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    SSEventReporttttt.phone_input_name_pop();
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return PhoneInputName(
          onClose: (v) {
            close();
            if (v != null && v.toString().isNotEmpty) {
              SSEventReporttttt.phone_input_name_pop_claim();
              PhoneCardController.to.setUserName(v.toString());
            }
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

class PhoneInputName extends StatefulWidget {
  const PhoneInputName({super.key, required this.onClose});

  final ValueChanged onClose;

  @override
  State<PhoneInputName> createState() => _PhoneInputNameState();
}

class _PhoneInputNameState extends State<PhoneInputName>
    with WidgetsBindingObserver {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  late VoidCallback focusListener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });

    focusListener = () {
      _listener();
    };

    focusNode.addListener(focusListener);
  }

  double topHeight = 0.h;
  String name = "";

  _listener() {
    ssLogggg("==focusListeners:${focusNode.hasFocus}==");
    if (mounted) {
      setState(() {
        if (focusNode.hasFocus) {
          topHeight = 150.h;
        } else {
          topHeight = 0.h;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: AnimatedContainer(
          duration: animD,
          color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
          child: Center(
            child: AnimatedScale(
              duration: animD,
              // offset: showAnimated ? Offset.zero : Offset(0, 1),
              // curve: Curves.linearToEaseOut,
              scale: showAnimated?1:0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 364.w,
                    height: 527.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.img.phonePopupJindu1.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),

                        Positioned.fill(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SSTxtGraBorder(
                                text: "input_name_1".tr,
                                fontWeight: FontWeight.w700,
                                fontSize: 48.sp,
                                fontFamily: FontFamily.alkatra,
                                strokeWidth: 3.w,
                                strokeColor: Color(0xffCC1420),
                              ),
                              SSTxtGraBorder(
                                text: "${"input_name_2".tr}!",
                                fontWeight: FontWeight.w700,
                                fontSize: 48.sp,
                                fontFamily: FontFamily.alkatra,
                                strokeWidth: 3.w,
                                strokeColor: Color(0xffCC1420),
                              ),
                              SizedBox(height: 12.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.w),
                                child: SSTxtGraBorder(
                                  text: "input_name_3".tr,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  fontFamily: FontFamily.alkatra,
                                  strokeWidth: 3.w,
                                  strokeColor: Color(0xff30120A),
                                ),
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 178.h,
                                    height: 178.h,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Positioned(
                                          left: -80.w,
                                          right: -80.w,
                                          top: -20.h,
                                          bottom: -20.h,
                                          child: SSRotateWidget(
                                            child: Image.asset(
                                              Assets
                                                  .img
                                                  .phoneCardXuanguang
                                                  .path,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          left: -80.w,
                                          right: -80.w,
                                          top: -20.h,
                                          bottom: -20.h,
                                          child: SSRotateWidget(
                                            child: Image.asset(
                                              Assets.img.xuanguang.path,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: 0.h,
                                          bottom: 10.h,
                                          child: Center(
                                            child: Image.asset(
                                              Assets.img.phoneCardPhone.path,
                                              width: 164.h,
                                              height: 164.h,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              inputWidget(),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 60.w),
                                child: SSTxtBorder(
                                  text:
                                      "input_name_4".tr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  height: 1.3,
                                ),
                              ),

                              SizedBox(height: 30.h),
                              btn(),
                              // GestureDetector(
                              //   onTap: () {
                              //     onClose();
                              //   },
                              //   child: Container(
                              //     width: 230.h,
                              //     height: 42.h,
                              //     decoration: BoxDecoration(
                              //       color: Color(0xff31C520),
                              //       borderRadius: BorderRadius.circular(100),
                              //     ),
                              //     child: Center(
                              //       child: SSTxtBorder(
                              //         text: "Claim My New Phone",
                              //         fontSize: 18.sp,
                              //         fontFamily: FontFamily.alkatra,
                              //         fontWeight: FontWeight.w800,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: topHeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  btn() {
    return GestureDetector(
      onTap: () {
        onClose();
      },
      child: Container(
        width: 212.h,
        height: 48.h,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: SSTxtBorder(
                text: "input_name_5".tr,
                fontSize: 18.sp,
                fontFamily: FontFamily.ghostKidAOEPro,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  inputWidget() {
    return Container(
      width: 246.w,
      height: 30.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Color(0xff300505).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(30.h),
        border: Border.all(color: Color(0xffFF3838), width: 1.w),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xffffffff),
          ),
          decoration: InputDecoration.collapsed(
            hintText: "input_name_6".tr,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xffC88A8A),
            ),
          ),
          keyboardType: TextInputType.text,
          onChanged: (text) {
            ssLogggg("===input text:$text===");
            name = text;
          },
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose(name);
  }

  double _keyboardHeight = 0;

  @override
  void didChangeMetrics() {
    // 获取键盘高度
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && _keyboardHeight == 0) {
      print('🧭 键盘弹起');
      focusNode.requestFocus();
    } else if (bottomInset == 0 && _keyboardHeight > 0) {
      print('🎯 键盘收起');
      focusNode.unfocus();
    }
    _keyboardHeight = bottomInset;
    ssLogggg("===_keyboardHeight:$_keyboardHeight===");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNode.removeListener(focusListener);
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }
}
