import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
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
  var box = SSHive.box;
  static const String khkp5000First = "withddd_people_5000_first";
  static const String khkp5000Second = "withddd_people_5000_second";
  int people5000First = 199;
  int people5000Second = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    int random =Random().nextInt(4);
    int random2 =Random().nextInt(3);
    int save5000First = box.get(khkp5000First)??199;
    int save5000Second = box.get(khkp5000Second)??30;

    people5000First = save5000First + random;
    people5000Second = save5000Second - random2;
    if(people5000Second <= 3){
      people5000Second = 3;
    }
    box.put(khkp5000First, people5000First);
    box.put(khkp5000Second, people5000Second);
    ssLogggg("===people5000First:$people5000First  people5000Second:$people5000Second===");


  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var cardId = WithdddController.to.curSaveCardId.value;
      return SingleChildScrollView(
        child: Column(
          children: [
            itemProgressss(money: MainController.minWithdddMoney),
            itemProgressss(money: 5000),
            itemVip(),
          ],
        ),
      );
    });
  }

  itemVip() {
    return VipPartner();
  }

  itemTxProgress({required double money}) {
    String selectedIcon = WithdddController.to.currentPaymentIconS();
    String strmoney =
        "${SSCountry.curGuojiaFuhao()} ${money.toStringAsFixed(0)} USD";

    bool hasOver1 = WithdddController.to.curLiucheng1SpinsOver.value;
    bool hasOver2 = WithdddController.to.curLiucheng2PaimingOver.value;
    bool hasOver3 = WithdddController.to.curLiucheng3SpinsOver.value;
    String text = "";
    double pro = 0;
    bool hasJieduan2 = false;
    if (!hasOver1) {
      int curaa = WithdddController.to.curSpinLiuceng1.value;
      int curAll = WithdddController.to.maxSpinCountWithWithdraw();
      text = "${curaa}/${curAll} SPINS";
      pro = curaa / curAll;
    } else if (!hasOver2) {
      int curaa = WithdddController.to.curRank();
      int curAll = WithdddController.to.allRank();
      text = "${curaa}/${curAll}";
      pro = (curAll - curaa) / curAll;
      hasJieduan2 = true;
    } else if (!hasOver3) {
      int curaa = WithdddController.to.curSpinLiuceng3.value;
      int curAll = WithdddController.to.spinWithLiuceng3();
      text = "${curaa}/${curAll} SPINS";
      pro = curaa / curAll;
    }

    ssLogggg(
      "========hasOver1:$hasOver1  hasOver2:$hasOver2 hasOver3:$hasOver3",
    );
    if (hasOver3) {
      pro = 1;
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                strmoney,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
              ),
              Spacer(),
              Icon(Icons.warning_amber, color: Color(0xffAF4A4A), size: 20.h),
              SizedBox(width: 4.w),
              Text(
                "Securing you account...",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Color(0xffAF4A4A),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.w),
          Row(
            children: [
              Image.asset(selectedIcon, width: 30.h, height: 30.h),
              SizedBox(width: 12.w),
              SSProjjjj(
                height: 16.h,
                innerHeight: 14.h,
                width: 160.w,
                progress: pro,
                gradientColors: [Color(0xff36F6B6), Color(0xff36F6B6)],
                bgColor: Color(0xff232428),
                text: text,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (hasOver3) {
                    ssTushi(
                      text:
                          "Withdrawal request submitted successfully. Under review.",
                    );
                    return;
                  }

                  if (hasJieduan2) {
                    WithdddController.to.onWithdraw(
                      money: MainController.minWithdddMoney,
                    );
                    return;
                  }
                  Navigator.maybePop(context);
                },
                child: Container(
                  width: 100.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.h),
                    color: WithdddController.to.bgColor(),
                  ),
                  child: Center(
                    child: Text(
                      hasOver3
                          ? "VERIFY"
                          : hasJieduan2
                          ? "SPEED"
                          : "SPIN",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: FontFamily.interBold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  itemProgressss({required double money}) {
    String des = "${people5000First} successful cash outs today! Only $people5000Second spots left";
    String jinduTxt = "";
    bool showTx =
        WithdddController.to.hasSaveCardId() &&
        WithdddController.to.hasSaveBank() &&
        money == 1000;

    ssLogggg("=====showTx:$showTx");

    if (money == 1000) {
      int day = SSDlTracking.qidongduoshaoDay();
      des = "90% of new users cash out on Day 1.";
      if (day > 1) {
        des = "80% of  users cash out today.";
      }
      if (WithdddController.to.hasSaveCardId() &&
          WithdddController.to.hasSaveBank()) {
        jinduTxt = "Securing you account...";
      }
      if (!WithdddController.to.curLiucheng1SpinsOver.value) {
        des =
            "You got this—finish the stage fee-free, trust us, cash out instantly! 💸";
      } else if (!WithdddController.to.curLiucheng2PaimingOver.value) {
        des = "You're next in line—cash out lightning-fast! 💸";
      } else if (!WithdddController.to.curLiucheng3SpinsOver.value) {
        des = "Quick security check! Spin %s times to get your cash.";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 82.h,
          margin: EdgeInsets.only(top: 20.w, left: 16.w, right: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Color(0xffffffff),
          ),
          child: showTx
              ? itemTxProgress(money: money)
              : Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            moenyWidget(money: money),
                            SizedBox(height: 4.h),
                            Spacer(),
                            progressWidget(money: money),
                          ],
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),

                    Positioned(
                      top: 5.h,
                      right: 5.w,
                      child: Text(
                        jinduTxt,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        SizedBox(height: 8.h,),
        Row(
          children: [
            SizedBox(width: 16.w,),
            Flexible(
              child: Text(
                des,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Color(0xff9BA3B0),
                ),
              ),
            ),
            SizedBox(width: 16.w,),
          ],
        ),
      ],
    );
  }

  Widget moenyWidget({required double money}) {
    String selectedIcon = WithdddController.to.currentPaymentIconS();
    String des = "90% of new users cash out on Day 1.";

    int quzheng = money ~/1000;

    String strmoney =
        "${SSCountry.curGuojiaFuhao()} ${quzheng.toStringAsFixed(0)},000";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(selectedIcon, width: 30.h, height: 30.h),
        SizedBox(width: 12.w),
        Text(
          strmoney,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget progressWidget({required double money}) {
    double curMmm = MainController.to.curMonnnn.value;
    String moneyT =
        "${SSCountry.curGuojiaFuhao()}${curMmm.toStringAsFixed(2)}/${money.toStringAsFixed(0)}";
    double pro = curMmm / money;
    if (pro < 0) {
      pro = 0;
    }
    // pro = 0.1;

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
            progress: pro,
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
    int quzheng = MainController.minWithdddMoney ~/ 1000;
    String money = "${SSCountry.curGuojiaFuhao()}${quzheng},000";
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
                  SizedBox(width: 2.w),
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
                      "Level ${MainController.to.level()}/${MainController.maxLevel}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
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
      SSEventReporttttt.vip_partner_click();
      Navigator.maybePop(context);
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
