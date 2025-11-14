import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayPhoneSpinToPieces {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return PhoneSpinToPieces(
          onClose: (v) {
            close();
            Navigator.maybePop(Get.context!);
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

class PhoneSpinToPieces extends StatefulWidget {
  const PhoneSpinToPieces({super.key, required this.onClose});

  final ValueChanged onClose;

  @override
  State<PhoneSpinToPieces> createState() => _PhoneSpinToPiecesState();
}

class _PhoneSpinToPiecesState extends State<PhoneSpinToPieces> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
        child: Center(
          child: AnimatedSlide(
            duration: animD,
            offset: showAnimated ? Offset.zero : Offset(0, 1),
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 360.w,
                  height: 470.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        child: Center(
                          child: Container(
                            color: Colors.teal.withValues(alpha: 0),
                            child: Image.asset(
                              Assets.img.phonePopupJindu2.path,
                              width: 360.w,
                              height: 470.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            SSTxtGraBorder(
                              text: "Piece",
                              fontWeight: FontWeight.w700,
                              fontSize: 48.sp,
                              fontFamily: FontFamily.alkatra,
                              strokeWidth: 3.w,
                              strokeColor: Color(0xffCC1420),
                            ),
                            SSTxtGraBorder(
                              text: "Collected!",
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
                                text: "Only (  2  ) more to go!",
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                fontFamily: FontFamily.alkatra,
                                strokeWidth: 3.w,
                                strokeColor: Color(0xff30120A),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            centerWidget(),

                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),

                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 50.h,
                        child: Center(child: btn()),
                      ),
                    ],
                  ),
                ),
              ],
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
                text: "Spin For More Pieces!",
                fontSize: 18.sp,
                fontFamily: FontFamily.alkatra,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  centerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Container(
        width: double.infinity,
        height: 180.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: 120.w,
                    height: 164.h,
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(color: Color(0xffFFE138), width: 2.w),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        SSTxtGraBorder(
                          text: "Your Nex Press",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.fraunces,
                          strokeColor: Color(0xff471717),
                        ),
                        SizedBox(height: 4.h),
                        SSTxtBorder(
                          text: "your next pretty piece",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.rubik,
                          foreground: Color(0xffC53333),
                        ),
                        Container(
                          width: 107.h,
                          height: 107.h,
                          child: Stack(
                            children: [
                              SSRotateWidget(
                                child: Image.asset(
                                  Assets.img.xuanguang.path,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),

                              Center(
                                child: Image.asset(
                                  Assets.img.phonePopupJindu2Time.path,
                                  width: 82.h,
                                  height: 82.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: 100.h,
                        height: 30.h,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.img.phonePopupJindu2Btntime.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Obx(() {
                                String toTime = PhoneCardController.to.toTime();
                                return SSTxtGraBorder(
                                  text: toTime,
                                  fontFamily: FontFamily.sansitaOne,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  strokeColor: Color(0xff30120A),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  Container(
                    width: 120.w,
                    height: 164.h,
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(color: Color(0xffFFE138), width: 2.w),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        SSTxtGraBorder(
                          text: "Find Secret",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.fraunces,
                          strokeColor: Color(0xff471717),
                        ),
                        SizedBox(height: 4.h),
                        SSTxtBorder(
                          text: "Find a of the map",
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.rubik,
                          foreground: Color(0xffC53333),
                        ),
                        Container(
                          width: 107.h,
                          height: 107.h,
                          child: Stack(
                            children: [
                              SSRotateWidget(
                                child: Image.asset(
                                  Assets.img.xuanguang.path,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),

                              Center(
                                child: Image.asset(
                                  Assets.img.phonePopupJindu2Star.path,
                                  width: 82.h,
                                  height: 82.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: Container(
                        width: 100.h,
                        height: 30.h,
                        child: Stack(
                          children: [
                            Image.asset(
                              Assets.img.phonePopupJindu2Btntime.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: SSTxtGraBorder(
                                text: "Our ith map",
                                fontFamily: FontFamily.sansitaOne,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                strokeColor: Color(0xff30120A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    setState(() {
      showAnimated = false;
    });
    await Future.delayed(animD);
    widget.onClose(null);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
