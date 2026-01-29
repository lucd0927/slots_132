import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_source2target.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card_controller.dart';

class PhoneBottomTime extends StatefulWidget {
  const PhoneBottomTime({super.key});

  @override
  State<PhoneBottomTime> createState() => _PhoneBottomTimeState();
}

class _PhoneBottomTimeState extends State<PhoneBottomTime> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  onclickClaim() {
    SSEventReporttttt.phone_page_claim();
    PhoneCardController.to.onclickClaim();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
        children: [
          GestureDetector(
            onTap: onclickClaim,
            child: Container(
              width: 285.h,
              height: 58.h,
              child: Stack(
                children: [
                  Image.asset(
                    PhoneCardController.to.canClickClaim.value
                        ? Assets.img.btnWheel.path
                        : Assets.img.btnPhoneClick.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10.h,
                    top: 0,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SSTxtBorder(
                            text: "bottom_time_1".tr,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                            fontFamily: FontFamily.ghostKidAOEPro,
                          ),
                          Builder(
                            builder: (context) {
                              overlayPhoneCard.childContext = context;
                              return Image.asset(Assets.img.phoneSuip.path,width: 34.w,height: 24,);
                            }
                          ),
                        ],
                      ),
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
    });
  }

  @override
  void dispose() {
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
              text: "${"boxgift_3".tr}:  [ ${PhoneCardController.to.toTime()} ]",
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
