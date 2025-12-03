import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_ad/adsid.dart';
import 'package:slots_132/jc_ad/common_ads.dart';
import 'package:slots_132/jc_gj/event_bus.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/shiimmer_img.dart';
import 'package:slots_132/ss_common/ss_event_bus.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheee_bottom.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheel_detail.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class Wheeee extends StatefulWidget {
  const Wheeee({super.key});

  @override
  State<Wheeee> createState() => _WheeeeState();
}

class _WheeeeState extends State<Wheeee> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SSEventReporttttt.wheel_page();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool hasOver = WheController.to.wheelEnd.value;
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                Assets.img.wheelBg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withValues(alpha: 0.0),
              ),

              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: 70.h),

                    Shimmer(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.1),
                          Colors.white.withValues(alpha: 1),
                          Colors.white.withValues(alpha: 0.1),
                          Colors.transparent,
                        ],
                        stops: [0, 0.44, 0.5, 0.54, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      child: Image.asset(
                        WheController.to.showOneMore.value
                            ? Assets.img.wheelTitleFreespin.path
                            : hasOver
                            ? Assets.img.wheelTitleCongrats.path
                            : Assets.img.wheelTitle.path,
                        width: 333.w,
                        height: 165.w,
                        fit: BoxFit.fill,
                        gaplessPlayback: true,
                      ),
                    ),
                    SSWheelDetail(
                      onEnd: (value) {
                        WheController.to.onSpinSub(value);
                      },
                    ),
                    if (!WheController.to.showOneMore.value) WheeeBottom(),
                  ],
                ),
              ),
              if (WheController.to.showOneMore.value)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: onTapSpin,
                    child: Column(children: [Spacer(), onMoreWidget()]),
                  ),
                ),

              Positioned(
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
              ),
            ],
          ),
        ),
      );
    });
  }

  onClose() {
    if (WheController.to.showOneMore.value) {
      SSEventReporttttt.wheel_more_pop_close();
    }
    Navigator.pop(context);
  }

  onMoreWidget() {
    return Container(
      color: Colors.blueAccent.withValues(alpha: 0.0),
      child: Column(
        children: [
          SSAScale(
            child: Shimmer(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white.withValues(alpha: 0.5),
                  Colors.white.withValues(alpha: 0.8),
                  Colors.white.withValues(alpha: 0.5),
                  Colors.transparent,
                ],
                stops: [0, 0.4, 0.5, 0.6, 1],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              child: SSTxtBorder(
                text: "Tap to Spin",
                fontColor: Color(0xffFFF700),
                fontSize: 40.sp,
                foreground: Color(0xffE63737),
                strokeWidth: 2.w,
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Container(
            width: 365.w,
            height: 63.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(63.h),
                  child: ShiningEffect(
                    shineColor: Colors.white,
                    opacity: 0.8,
                    angle: 0.1,
                    duration: const Duration(seconds: 2),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          Assets.img.btnWheelOneMore.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: SSTxtBorder(
                            text: "ONE MORE FREE SPIN",
                            fontColor: Color(0xffFFF700),
                            fontSize: 28.sp,
                            foreground: Color(0xffE63737),
                            strokeWidth: 2.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -10.h,
                  right: 0,
                  child: Image.asset(
                    Assets.img.video.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 90.h),
        ],
      ),
    );
  }

  onTapSpin() async {
    SSEventReporttttt.wheel_more_pop_tap();
    bool result = await SSCommonAds().showRewardAd(
      adPosId: SSAdsPosId.eyomt_wheelspin_rv,
      ignored_hasDisplayAd: true,
    );
    if(!result){
      return;
    }
    SSEventBus.fire(WheelEvent());
  }
}
