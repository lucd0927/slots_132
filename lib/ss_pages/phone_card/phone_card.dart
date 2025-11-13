import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/ss_rotate.dart';
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

    Get.put(PhoneCardController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showA = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          top: -20.h,
                          bottom: 20.h,
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
                                Image.asset(
                                  Assets.img.phoneCardTopBg.path,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
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
                                  top: 20.h,
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
                          top: 40.h,
                          child: Center(
                            child: Hero(
                              tag: "Phoneeee",
                              child: Image.asset(
                                Assets.img.phoneCardPhone.path,
                                width: 164.h,
                                height: 164.h,
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
              top: 290.h,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 338.h,
                      height: 357.h,
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
                                SizedBox(height: 16.h),
                                SSTxtGraBorder(
                                  text: "9 pieces = Your signed phone.",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(height: 16.h),
                                card(),
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

    img1 = Assets.img.phoneCardCard1S.path;
    // img2 =  Assets.img.phoneCardCard2S.path;
    img3 = Assets.img.phoneCardCard3S.path;
    // img4 =  Assets.img.phoneCardCard4S.path;
    img5 = Assets.img.phoneCardCard5S.path;
    img6 = Assets.img.phoneCardCard6S.path;
    // img7 =  Assets.img.phoneCardCard7S.path;
    img8 = Assets.img.phoneCardCard8S.path;
    // img9 =  Assets.img.phoneCardCard9S.path;

    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: showA ? 1.0 : 0.5,
      // offset:showA? Offset.zero:Offset(0, 1),
      child: Container(
        width: 286.h,
        height: 284.h,
        color: Colors.teal.withValues(alpha: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                img1,
                width: 96.h,
                height: 96.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 75.h,
              top: 0,
              child: Image.asset(
                img2,
                width: 140.h,
                height: 96.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0.h,
              top: 0,
              child: Image.asset(
                img3,
                width: 92.h,
                height: 96.h,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              left: 0.h,
              top: 96.h,
              child: Image.asset(
                img4,
                width: 96.h,
                height: 114.h,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              left: 74.8.h,
              top: 73.h,
              child: Image.asset(
                img5,
                width: 140.h,
                height: 137.h,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              right: 0.h,
              top: 96.h,
              child: Image.asset(
                img6,
                width: 93.h,
                height: 115.h,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              left: 0.h,
              bottom: 0.h,
              child: Image.asset(
                img7,
                width: 96.h,
                height: 95.h,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              left: 75.h,
              bottom: 0.h,
              child: Image.asset(
                img8,
                width: 140.h,
                height: 96.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0.h,
              bottom: 0.h,
              child: Image.asset(
                img9,
                width: 92.h,
                height: 96.h,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
