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

    int random = Random().nextInt(4);
    int random2 = Random().nextInt(3);
    int save5000First = box.get(khkp5000First) ?? 199;
    int save5000Second = box.get(khkp5000Second) ?? 30;

    people5000First = save5000First + random;
    people5000Second = save5000Second - random2;
    if (people5000Second <= 3) {
      people5000Second = 3;
    }
    box.put(khkp5000First, people5000First);
    box.put(khkp5000Second, people5000Second);
    ssLogggg(
      "===people5000First:$people5000First  people5000Second:$people5000Second===",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var cardId = WithdddController.to.curSaveCardId.value;
      return SingleChildScrollView(
        child: Column(
          children: [
            itemProgressss(money: MainController.minWithdddMoney),
            itemProgressss(money: 5000 * MainController.countryBeisu),
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
    int quzheng = money ~/ 1000;

    String strmoney =
        "${SSCountry.curGuojiaFuhao()} ${quzheng.toStringAsFixed(0)},000";
    // String strmoney =
    //     "${SSCountry.curGuojiaFuhao()} ${money.toStringAsFixed(0)} USD";

    bool hasOver1 = WithdddController.to.curLiucheng1SpinsOver.value;
    bool hasOver2 = WithdddController.to.curLiucheng2PaimingOver.value;
    bool hasOver3 = WithdddController.to.curLiucheng3SpinsOver.value;
    String text = "";
    double pro = 0;
    bool hasJieduan2 = false;
    if (!hasOver1) {
      int curaa = WithdddController.to.curSpinLiuceng1.value;
      int curAll = WithdddController.to.maxSpinCountWithWithdraw();
      text = "${curaa}/${curAll} ${"tab_view_1".tr}";
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
      text = "${curaa}/${curAll} ${"tab_view_1".tr}";
      pro = curaa / curAll;
    }

    ssLogggg(
      "========hasOver1:$hasOver1  hasOver2:$hasOver2 hasOver3:$hasOver3",
    );
    String jinduTxt = "tab_view_2".tr;
    if (!WithdddController.to.curLiucheng1SpinsOver.value) {
      jinduTxt = "tab_view_3".tr;
    } else if (!WithdddController.to.curLiucheng2PaimingOver.value) {
      jinduTxt = "tab_view_4".tr;
    } else if (!WithdddController.to.curLiucheng3SpinsOver.value) {
      jinduTxt = "tab_view_5".tr;
    }
    if (hasOver3) {
      pro = 1;
      jinduTxt = "tab_view_6".tr;
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
                jinduTxt,
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
                    ssTushi(text: "tab_view_7".tr);
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
                          ? "VERIFY".tr
                          : hasJieduan2
                          ? "Speed".tr
                          : "SPIN".tr,
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
    String des =
        "${people5000First} ${"tab_view_8".tr} ${"Only".tr} $people5000Second ${"tab_view_9".tr}";

    double tmpmmmm = 1000 * MainController.countryBeisu;
    bool showTx =
        WithdddController.to.hasSaveCardId() &&
        WithdddController.to.hasSaveBank() &&
        money == tmpmmmm;

    ssLogggg("=====showTx:$showTx");

    if (money == tmpmmmm) {
      int day = SSDlTracking.qidongduoshaoDay();
      des = "tab_view_10".tr;
      if (day > 1) {
        des = "tab_view_11".tr;
      }
      if (WithdddController.to.hasSaveCardId() &&
          WithdddController.to.hasSaveBank()) {
        if (!WithdddController.to.curLiucheng1SpinsOver.value) {
          des = "tab_view_12".tr;
          bool showOther = WithdddController.to.txProgressStatus.value;
          if (showOther) {
            des = "tab_view_13".tr;
          }
        } else if (!WithdddController.to.curLiucheng2PaimingOver.value) {
          des = "tab_view_14".tr;
          bool showOther = WithdddController.to.txProgressStatus.value;
          if (showOther) {
            des = "${"tab_view_15".tr} ";
          }
        } else if (!WithdddController.to.curLiucheng3SpinsOver.value) {
          des = "tab_view_16".tr;
          bool showOther = WithdddController.to.txProgressStatus.value;
          if (showOther) {
            des = "tab_view_17".tr;
          }
        }

        if (WithdddController.to.curLiucheng3SpinsOver.value) {
          des = "tab_view_18".tr;
          bool showOther = WithdddController.to.txProgressStatus.value;
          if (showOther) {
            des = "tab_view_19".tr;
          }
        }
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

                    // Positioned(
                    //   top: 5.h,
                    //   right: 5.w,
                    //   child: Text(
                    //     jinduTxt,
                    //     style: TextStyle(
                    //       fontSize: 16.sp,
                    //       color: Colors.red,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 16.w),
            Flexible(
              child: money > 1000
                  ? Text.rich(
                      TextSpan(
                        text: "",
                        children: [
                          TextSpan(
                            text: "${people5000First}",
                            style: TextStyle(color: Color(0xff3AAD47)),
                          ),
                          TextSpan(text: "  ${"tab_view_8".tr} ${"Only".tr}  "),
                          TextSpan(
                            text: "$people5000Second",
                            style: TextStyle(color: Color(0xff3AAD47)),
                          ),
                          TextSpan(text: "  ${"tab_view_9".tr}"),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        color: Color(0xff9BA3B0),
                      ),
                    )
                  : Text(
                      des,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        color: Color(0xff9BA3B0),
                      ),
                    ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ],
    );
  }

  Widget moenyWidget({required double money}) {
    String selectedIcon = WithdddController.to.currentPaymentIconS();

    int quzheng = money ~/ 1000;

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
            fontSize: !SSCountry.hasUSA() ? 20.sp : 24.sp,
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
    String des = "tab_view_20".tr;
    String time = toTime();
    // ssLogggg("====time:$time");
    return Column(
      children: [
        Container(
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
                      "mian_8".tr,
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
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.img.withddVip.path,
                          width: 30.w,
                          height: 30.w,
                        ),
                        SizedBox(width: 2.w),
                        Flexible(child:  Text.rich(
                          TextSpan(
                            text: "activate_my_status_6".tr,
                            children: [
                              TextSpan(
                                text: money,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff3AAD47),
                                  height: 1,
                                ),
                              ),
                              TextSpan(text: "Payout".tr),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Spacer(),
                  hasClickVip()
                      ? Text(
                          "${"exp_2".tr} ${MainController.to.level()}/${MainController.maxLevel}",
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
                                "tab_view_21".tr,
                                style: TextStyle(
                                  fontFamily: FontFamily.rubik,
                                  fontSize: !SSCountry.hasUSA() ? 10.sp : 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff),
                                  height: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SizedBox(width: 16.w),
            Flexible(
              child: Text(
                des,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  height: 1,
                  color: Color(0xff9BA3B0),
                ),
              ),
            ),
          ],
        ),
      ],
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
