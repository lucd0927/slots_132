import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
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
    String des =
        "Become a Partner and wake up to \$1000.00 in your account. Every. Single. Day.";
    String money =
        "${SSCountry.curGuojiaFuhao()} 1000";
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
                Row(
                  children: [
                    Image.asset(
                      Assets.img.withddTime.path,
                      width: 16.w,
                      height: 16.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "12:00:00",
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
                  SizedBox(width: 12.w),
                  Text(
                    "Daily",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text(
                      "$money",
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
                      height: 1,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 4.h),
              Spacer(),
              GestureDetector(
                onTap: onWithdraw,

                child: Container(
                  width: 120.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: WithdddController.to.bgColor(),
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
