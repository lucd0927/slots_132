// dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/history/history_c.dart';

class Historyyyy extends StatefulWidget {
  const Historyyyy({super.key});

  @override
  State<Historyyyy> createState() => _HistoryyyyState();
}

class _HistoryyyyState extends State<Historyyyy> {
  late List<GiftRewardModel> groups;
  List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    SSEventReporttttt.transaction_history_page();

    groups = MainController.to.getHistory();

    for (var value in groups) {
      Widget item = _item(value);
      children.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),

      body: DefaultTextStyle(
        style: TextStyle(fontFamily: FontFamily.rubik),
        child: Column(
          children: [
            header(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4),
                children: children,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight + 10.h),
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).maybePop(),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 24.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  String formatTime(DateTime time) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  }

  _item(GiftRewardModel giftModel) {
    String leftImg = Assets.img.moneyGift.path;

    String title = "Money";
    int dtime = giftModel.time ?? 0;
    double money = giftModel.num;
    bool hasAdd = money > 0;
    String time = formatTime(DateTime.fromMillisecondsSinceEpoch(dtime));
    EnumGiftRewardModel giftRewardModel = giftModel.rewardModelType;
    String symbol = hasAdd ? "" : "";
    String rightTxt = "";
    if (giftRewardModel == EnumGiftRewardModel.cash) {
      leftImg = Assets.img.moneyGift.path;
      title = "Money";
      rightTxt =
          "$symbol ${SSCountry.curGuojiaFuhao()}${money.toStringAsFixed(2)}";
    } else if (giftRewardModel == EnumGiftRewardModel.xp) {
      leftImg = Assets.img.mainTopXp.path;
      title = "Exp";
      rightTxt = "+ ${money.toStringAsFixed(0)}";
    }

    Color color = Color(0xffD03131);
    if (hasAdd) {
      color = Color(0xff3AAD47);
    }

    return Container(
      width: double.infinity,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(
        children: [
          Image.asset(leftImg, width: 32.w, height: 32.w),
          SizedBox(width: 16.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                time,
                style: TextStyle(
                  color: Color(0xffA2A2A7),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            rightTxt,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
