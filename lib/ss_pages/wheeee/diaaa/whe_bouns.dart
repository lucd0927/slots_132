import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';

class WheBouns extends StatefulWidget {
  const WheBouns({super.key, required this.giftRewardModel});

  final GiftRewardModel giftRewardModel;

  @override
  State<WheBouns> createState() => _WheBounsState();
}

class _WheBounsState extends State<WheBouns> {
  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.transparent,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 70.h),
              // Image.asset(
              //   Assets.img.wheelTitleCongrats.path,
              //   width: 333.w,
              //   height: 165.w,
              //   fit: BoxFit.fill,
              // ),
              Spacer(),
              Container(
                width: double.infinity,
                height: 230.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      Assets.img.wheelZpBottomBg.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),

                    Positioned(
                      top: -60.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 141.h,
                          height: 101.h,
                          // color: Colors.black,
                          child: Stack(
                            children: [
                              Image.asset(
                                Assets.img.wheelZpBottomW.path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: 24.h,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.brown.withValues(alpha: 0.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 34.h),
                                      Container(
                                        width: 84.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xff180B32),
                                          borderRadius: BorderRadius.circular(
                                            20.h,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget
                                                        .giftRewardModel
                                                        .rewardModelType ==
                                                    EnumGiftRewardModel.cash
                                                ? "${SSCountry.curGuojiaFuhao()}${widget.giftRewardModel.num}"
                                                : widget
                                                          .giftRewardModel
                                                          .rewardModelType ==
                                                      EnumGiftRewardModel
                                                          .iphoneCard
                                                ? "+${widget.giftRewardModel.num}"
                                                : widget
                                                          .giftRewardModel
                                                          .rewardModelType ==
                                                      EnumGiftRewardModel.xp
                                                ? "+${widget.giftRewardModel.num}"
                                                : "",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xffEBFB01),
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SSTxtBorder(text: "Wheel Bonus",fontSize: 14.sp,strokeWidth: 2.w,foreground: Color(0xff331C74),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Column(
                      children: [
                        SizedBox(height: 50.h),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.img.wheelZpBottomMoneyBg.path,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 20.w),
                              Image.asset(
                                Assets.img.freewheel.path,
                                width: 82.h,
                                height: 57.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Image.asset(
                                  Assets.img.money.path,
                                  width: 65.h,
                                  height: 50.h,
                                ),
                              ),
                              SSTxtGraBorder(
                                text:
                                    widget.giftRewardModel.rewardModelType ==
                                        EnumGiftRewardModel.cash
                                    ? "${SSCountry.curGuojiaFuhao()}${widget.giftRewardModel.num}"
                                    : widget.giftRewardModel.rewardModelType ==
                                          EnumGiftRewardModel.iphoneCard
                                    ? "+${widget.giftRewardModel.num}"
                                    : widget.giftRewardModel.rewardModelType ==
                                          EnumGiftRewardModel.xp
                                    ? "+${widget.giftRewardModel.num}"
                                    : "",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                strokeColor: Color(0xffEE101E),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        btn(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
    );
    return Material(color: Colors.transparent, child: child);
    return Scaffold(body: child);
  }

  btn() {
    return GestureDetector(
      onTap: onclickClaim,
      child: Container(
        width: 285.h,
        height: 58.h,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.btnWheel.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SSTxtBorder(
                    text: "Claim Today’s Piece",
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    fontFamily: FontFamily.alkatra,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onclickClaim() {
  }
}
