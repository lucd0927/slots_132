import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';

class WheBouns extends StatefulWidget {
  const WheBouns({super.key,required this.giftRewardModel});
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
              Image.asset(
                Assets.img.wheelTitleCongrats.path,
                width: 333.w,
                height: 165.w,
                fit: BoxFit.fill,
              ),
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
                                  top: 10.h,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                color: Colors.brown,
                              ))
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
}
