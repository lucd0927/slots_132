import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_hive/sshive.dart';

class WheeeBottom extends StatefulWidget {
  const WheeeBottom({super.key});

  @override
  State<WheeeBottom> createState() => _WheeeBottomState();
}

class _WheeeBottomState extends State<WheeeBottom> {
  // var box = SSHive.box;



  @override
  Widget build(BuildContext context) {
    double distance = 40.w;
    return Container(
      width: 356.w,
      height: 77.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.wheelTimeBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 10.h,
            bottom: 0,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.yellow.withValues(alpha: 0.0),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Container(
                    color: Colors.red.withValues(alpha: 0),
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    height: 52.h,
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            Assets.img.wheelRili.path,
                            width: 34.h,
                            height: 38.h,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: -10.w,
                            right: -10.w,
                            bottom: -5.h,
                            child: Center(
                              child: SSTxtGraBorder(
                                text: "STREAK",
                                fontSize: 12.sp,
                                strokeColor: Color(0xffCC1420),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Positioned(
                          child: dayItem(today: 1, money: 1),
                          left: 0,
                        ),
                        Positioned(
                          child: dayItem(today: 2, money: 1.2),
                          left: distance,
                        ),
                        Positioned(
                          child: dayItem(today: 3, money: 1.4),
                          left: distance * 2,
                        ),
                        Positioned(
                          child: dayItem(today: 4, money: 1.8),
                          left: distance * 3,
                        ),
                        Positioned(
                          child: dayItem(today: 5, money: 2.2),
                          left: distance * 4,
                        ),
                        Positioned(
                          child: dayItem(today: 6, money: 2.6),
                          left: distance * 5,
                        ),
                        Positioned(
                          child: dayItem(today: 7, money: 3.0),
                          left: distance * 6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dayItem({required int today, required double money}) {
    String icon = Assets.img.wheelTime.path;
    // double money = 50;
    Color topColor = Color(0xffFF0000);
    Color bottomColor = Color(0xffFFffff);
    String txtMoney =
        "x ${money}";
    // int today = 1;
    String txtDay = "DAY $today";
    if (today == 7) {
      icon = Assets.img.wheelTime3.path;
      topColor = Color(0xffFFffff);
      bottomColor = Color(0xffFFffff);
    }
    int curToday = SSDlTracking.lianxuLoginDay();
    if (today == curToday) {
      icon = Assets.img.wheelTime2.path;
      topColor = Color(0xffFFffff);
      bottomColor = Color(0xffFF0000);
    }

    return Center(
      child: Container(
        width: 46.w,
        height: 50.h,
        child: Stack(
          children: [
            Image.asset(
              icon,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: Container(
                color: Colors.brown.withValues(alpha: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SSTxtBorder(
                      text: txtMoney,
                      fontSize: 12.sp,
                      fontFamily: FontFamily.rubik,
                      fontColor: topColor,
                      strokeWidth: 0.1,
                    ),
                    SSTxtBorder(
                      text: txtDay,
                      fontSize: 10.sp,
                      fontFamily: FontFamily.rubik,
                      fontColor: bottomColor,
                      foreground: Color(0xffFF7029),
                      strokeWidth: 0.1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
