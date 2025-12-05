import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';
import 'package:slots_132/ss_pages/phone_card/ddd/phone_input_name.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';
import 'package:slots_132/ss_pages/phone_card/vvvvv/bottom_time.dart';

class PhoneCardPage extends StatefulWidget {
  const PhoneCardPage({super.key});

  @override
  State<PhoneCardPage> createState() => _PhoneCardPageState();
}

class _PhoneCardPageState extends State<PhoneCardPage> {
  bool showA = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SSEventReporttttt.phone_page();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            showA = true;
          });
          if (PhoneCardController.to.getUserName().isEmpty) {
            Future.delayed(Duration(milliseconds: 800), () {
              OverlayPhoneInputName().show();
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.phoneCardBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),

                  Container(
                    width: 314.h,
                    height: 314.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: -80.w,
                          right: -80.w,
                          top: -80.h,
                          bottom: -80.h,
                          child: SSRotateWidget(
                            child: Image.asset(
                              Assets.img.phoneCardXuanguang.path,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 10.h,
                          child: Container(
                            width: 280.w,
                            height: 41.h,

                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Image.asset(
                                //   Assets.img.phoneCardTopBg.path,
                                //   width: double.infinity,
                                //   height: double.infinity,
                                //   fit: BoxFit.fill,
                                // ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: -10.h,
                                  child: Center(
                                    child: SSTxtGraBorder(
                                      text: "A Decade of Fun.",
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffEEFF00),
                                          Color(0xffFFD738),
                                        ],
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                      ),
                                      fontSize: 32.sp,
                                      fontFamily: FontFamily.fraunces,
                                      strokeColor: Color(0xffEEFF00),
                                      strokeWidth: 1.w,
                                      showShadow: true,
                                      shadowColor: Color(0xffFF6A00),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 28.h,
                                  child: Center(
                                    child: SSTxtGraBorder(
                                      text: "A Grand Prize for You.",
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xff00FFDD),
                                          Color(0xff00FFDD),
                                          Color(0xffffffff),
                                          Color(0xff00FFDD),
                                          Color(0xff00FFDD),
                                          Color(0xff00FFDD),
                                        ],
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                      ),
                                      fontSize: 16.sp,
                                      fontFamily: FontFamily.fraunces,
                                      strokeColor: Color(0xff00A6FF),
                                      strokeWidth: 1.w,
                                      showShadow: false,
                                      shadowColor: Color(0xffFF6A00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 10.h,
                          child: Center(
                            child: Hero(
                              tag: "Phoneeee",
                              child: Stack(
                                children: [
                                  Image.asset(
                                    Assets.img.phoneCardPhone.path,
                                    width: 250.h,
                                    height: 250.h,
                                  ),
                                  Positioned(
                                    right: 30.w,
                                    bottom: 44.h,
                                    child: GetBuilder<PhoneCardController>(
                                      builder: (con) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            width: 100.w,
                                            height: 100.h,
                                            color: Colors.brown.withValues(
                                              alpha: 0.0,
                                            ),
                                            child: Transform.rotate(
                                              angle: 90 * pi / 180,
                                              child: Text(
                                                PhoneCardController.to
                                                    .getUserName(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontFamily.ephesis,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25.sp,
                                                  height: 1,
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
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

            Positioned(
              left: 0,
              right: 0,
              top: 330.h,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 300.h,
                      height: 308.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.img.phoneCardCenterBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned.fill(
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                SSTxtGraBorder(
                                  text: "9 pieces = Your signed phone.",
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 16.h),
                                Obx(() {
                                  return card();
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    PhoneBottomTime(),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 50.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.img.btnBack.path,
                  width: 42.w,
                  height: 27.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  card() {
    String img1 = Assets.img.phoneCardCard1.path;
    String img2 = Assets.img.phoneCardCard2.path;
    String img3 = Assets.img.phoneCardCard3.path;
    String img4 = Assets.img.phoneCardCard4.path;
    String img5 = Assets.img.phoneCardCard5.path;
    String img6 = Assets.img.phoneCardCard6.path;
    String img7 = Assets.img.phoneCardCard7.path;
    String img8 = Assets.img.phoneCardCard8.path;
    String img9 = Assets.img.phoneCardCard9.path;
    // 当前收集了多少卡片
    int collectIndex = PhoneCardController.to.collectCardNum.value;
    // 卡片数量
    List data = PhoneCardController.to.getCardIndexList();
    int length = data.length;
    int tmpIndex = collectIndex;
    if (collectIndex >= length) {
      tmpIndex = length - 1;
    }

    int nextIndex = data[tmpIndex];
    PhoneCardController.to.curHeroIndex = nextIndex;
    for (int i = 0; i < collectIndex; i++) {
      if (i < length) {
        int selected = data[i];
        // nextIndex = selected;
        if (selected == 0) {
          img1 = Assets.img.phoneCardCard1S.path;
        } else if (selected == 1) {
          img2 = Assets.img.phoneCardCard2S.path;
        } else if (selected == 2) {
          img3 = Assets.img.phoneCardCard3S.path;
        } else if (selected == 3) {
          img4 = Assets.img.phoneCardCard4S.path;
        } else if (selected == 4) {
          img5 = Assets.img.phoneCardCard5S.path;
        } else if (selected == 5) {
          img6 = Assets.img.phoneCardCard6S.path;
        } else if (selected == 6) {
          img7 = Assets.img.phoneCardCard7S.path;
        } else if (selected == 7) {
          img8 = Assets.img.phoneCardCard8S.path;
        } else if (selected == 8) {
          img9 = Assets.img.phoneCardCard9S.path;
        }
      }
    }

    ssLogggg("===nextIndex:$nextIndex==collectIndex:$collectIndex==");
    double scale2 = 1;
    double scale = 1;
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      // scale: showA ? 1.0 : 0.9,
      opacity: showA ? 1.0 : 0.9,
      // offset: showA ? Offset.zero : Offset(1, 0),
      child: Container(
        width: 247.h,
        height: 247.h,
        color: Colors.teal.withValues(alpha: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 0) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img1,
                    width: 84.h * scale,
                    height: 84.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Positioned(
              left: 65.h,
              top: 0,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 1) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img2,
                    width: 121.h * scale,
                    height: 83.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Positioned(
              right: 0.h,
              top: 0,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 2) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img3,
                    width: 80.h * scale,
                    height: 83.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),

            Positioned(
              left: 0.h,
              top: 84.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 3) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img4,
                    width: 83.h * scale,
                    height: 99.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),

            Positioned(
              left: 65.h,
              top: 64.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 4) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img5,
                    width: 121.h * scale,
                    height: 119.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),

            Positioned(
              right: 0.h,
              top: 84.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 5) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img6,
                    width: 80.h * scale,
                    height: 99.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),

            Positioned(
              left: 0.h,
              bottom: 0.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 6) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img7,
                    width: 83.h * scale,
                    height: 83.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),

            Positioned(
              left: 65.h,
              bottom: 0.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 7) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img8,
                    width: 121.h * scale,
                    height: 83.h * scale,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Positioned(
              right: 0.h,
              bottom: 0.h,
              child: Builder(
                builder: (context) {
                  if (nextIndex == 8) {
                    overlayPhoneCard.targetContext = context;
                  }
                  return Image.asset(
                    img9,
                    width: 80.h * scale,
                    height: 83.h,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
