import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/activate_my_status.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class SSTabView extends StatefulWidget {
  const SSTabView({super.key});

  @override
  State<SSTabView> createState() => _SSTabViewState();
}

class _SSTabViewState extends State<SSTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [itemWithdrawwww(), itemProgressss(), itemVip()]),
    );
  }

  itemVip() {
    return VipPartner();
  }

  itemWithdrawwww() {
    String selectedIcon = WithdddController.to.currentPaymentIconS();
    String des = "90% of new users cash out on Day 1.";
    String money =
        "${SSCountry.curGuojiaFuhao()} ${MainController.to.curMonnnn.value}";
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Color(0xffffffff),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                moenyWidget(),
                SizedBox(height: 4.h),
                Text(
                  des,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    height: 1,
                    color: Color(0xff9BA3B0),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onWithdraw,

            child: Container(
              width: 100.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: WithdddController.to.bgColor(),
                borderRadius: BorderRadius.circular(32.h),
              ),
              child: Center(
                child: Text(
                  "Withdraw",
                  style: TextStyle(
                    fontFamily: FontFamily.rubik,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemProgressss() {
    String des = "199 successful cash outs today! Only 10 spots left";
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              moenyWidget(),
              SizedBox(height: 4.h),
              Spacer(),
              progressWidget(),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            des,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              height: 1,
              color: Color(0xff9BA3B0),
            ),
          ),
        ],
      ),
    );
  }

  Widget moenyWidget() {
    String selectedIcon = WithdddController.to.currentPaymentIconS();
    String des = "90% of new users cash out on Day 1.";
    String money =
        "${SSCountry.curGuojiaFuhao()} ${MainController.to.curMonnnn.value}";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(selectedIcon, width: 30.h, height: 30.h),
        SizedBox(width: 12.w),
        Text(
          money,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget progressWidget() {
    String moneyT = "${SSCountry.curGuojiaFuhao()}3899.7/5000.00";
    return Container(
      width: 128.w,
      // height: 16.h,
      child: Column(
        children: [
          Text(
            moneyT,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
              color: Color(0xff081100),
            ),
          ),
          SSProjjjj(
            height: 16.h,
            innerHeight: 14.h,
            width: 128.w,
            progress: 0.2,
            gradientColors: [Color(0xff36F6B6), Color(0xff36F6B6)],
            bgColor: Color(0xff232428),
            text: "",
          ),
        ],
      ),
    );
  }

  void onWithdraw() {}
}

class VipPartner extends StatefulWidget {
  const VipPartner({super.key});

  @override
  State<VipPartner> createState() => _VipPartnerState();
}

class _VipPartnerState extends State<VipPartner> {
  Timer? _timer;

  var box = SSHive.box;
  String key = WithdddController.hkVipTime;

  int curSecondSinceEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  int shengyuTime = WithdddController.vipPartnerTime;

  bool hasClickVip() {
    return WithdddController.to.hasClickVipGet();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (hasClickVip()) {
      ssLogggg("=init hasClickVip return===");
      return;
    } else {
      initTimer();
    }
  }

  initTimer() {
    int? time = box.get(key);
    // time = null;
    if (time == null) {
      time = curSecondSinceEpoch();
      box.put(key, time);
      shengyuTime = WithdddController.vipPartnerTime;
    } else {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time;
      shengyuTime = WithdddController.vipPartnerTime - tmpDiff;
    }

    // ssLogggg("=init shengyuTime:$shengyuTime===");
    _timer = Timer.periodic(Duration(seconds: 1), (tmpTimer) {
      int curTime = curSecondSinceEpoch();
      int tmpDiff = curTime - time!;
      shengyuTime = WithdddController.vipPartnerTime - tmpDiff;
      // ssLogggg("=shengyuTime:$shengyuTime===");
      setState(() {});
      if (shengyuTime < 0) {
        box.put(key, time);
        tmpTimer.cancel();
        return;
      }
      box.put(key, time);
    });
  }

  String toTime() {
    if (shengyuTime <= 0) {
      return "00:00:00";
    }
    final duration = Duration(seconds: shengyuTime);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    final formatted = "$hours:$minutes:$secs";
    return formatted;
  }

  bool canclick() {
    return shengyuTime > 0;
  }

  @override
  Widget build(BuildContext context) {
    String money = MainController.to.minWithdddMoneyWithCountry;
    String des =
        "Become a Partner and wake up to \$1000 in your account. Every. Single. Day.";
    String time = toTime();
    // ssLogggg("====time:$time");
    return Container(
      width: double.infinity,
      height: 100.h,
      margin: EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: Color(0xffffffff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 30.h,
            child: Row(
              children: [
                Text(
                  "VIP Partner",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffE9741B),
                  ),
                ),
                const Spacer(),
                if (!hasClickVip())
                  Row(
                    children: [
                      Image.asset(
                        Assets.img.withddTime.path,
                        width: 16.w,
                        height: 16.w,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffB12121),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.img.withddVip.path,
                    width: 30.w,
                    height: 30.w,
                  ),
                  SizedBox(width: 4.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Daily",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Text(
                          money,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3AAD47),
                            height: 1,
                          ),
                        ),
                      ),

                      Text(
                        "Payout",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // SizedBox(height: 4.h),
              Spacer(),
              hasClickVip()
                  ? Text(
                      "Level ${MainController.to.curLevel.value}/${MainController.maxLevel}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: Color(0xff222317),
                        height: 1,
                      ),
                    )
                  : GestureDetector(
                      onTap: onGetChange,

                      child: Container(
                        width: 120.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: !canclick()
                              ? Color(0xffBDC8D7)
                              : WithdddController.to.bgColor(),
                          borderRadius: BorderRadius.circular(32.h),
                        ),
                        child: Center(
                          child: Text(
                            "Get a chance to...",
                            style: TextStyle(
                              fontFamily: FontFamily.rubik,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            des,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              height: 1,
              color: Color(0xff9BA3B0),
            ),
          ),
        ],
      ),
    );
  }

  void onGetChange() {
    if (canclick()) {
      OverlayActivateMyStatus().show();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
}
