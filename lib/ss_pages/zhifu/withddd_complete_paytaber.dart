import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';

class WithdddCompletePaytaber extends StatefulWidget {
  const WithdddCompletePaytaber({super.key});

  @override
  State<WithdddCompletePaytaber> createState() =>
      _WithdddCompletePaytaberState();
}

class _WithdddCompletePaytaberState extends State<WithdddCompletePaytaber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff6A29B9), Color(0xff301253)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            PaytabelTopNavMoney(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
              child: Column(
                children: [
                  Text(
                    "Welcome, future Partner!",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Your journey to a guaranteed \$1,000 a day has begun.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "To prove your commitment and unlock this status,you must complete the Partner Trial.",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffFFFFFF), Color(0xffFFFFFF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      "YOUR TRIAL:",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4.h),
                    Text.rich(
                      TextSpan(
                        text: "REACH LEVEL ",
                        children: [
                          TextSpan(
                            text: "100",
                            style: TextStyle(color: Color(0xff3325FF)),
                          ),
                        ],
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Image.asset(
                      Assets.img.oneLastCheckOver.path,
                      width: 316.w,
                      height: 127.h,
                    ),
                    SizedBox(height: 20.h),
                    Text.rich(
                      TextSpan(
                        text: "Lv ",
                        children: [
                          TextSpan(
                            text: "45",
                            style: TextStyle(color: Color(0xff3325FF)),
                          ),
                          TextSpan(text: "/100"),
                        ],
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SSProjjjj(
                      height: 18.h,
                      innerHeight: 16.h,
                      width: 323.w,
                      progress: 0.5,
                      gradientColors: [Color(0xff23FFB6), Color(0xff23FFB6)],
                      bgColor: Color(0xff353C55),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "Don't worry,we'll help you get there faster. Here's a boost to start!",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 230.h,
                        height: 42.h,
                        decoration: BoxDecoration(
                          // color: Color(0xff164CFF),
                          color: Color(0xff31C520),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Text(
                            "Claim 24h of Double XP!",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
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

class PaytabelTopNavMoney extends StatefulWidget {
  const PaytabelTopNavMoney({super.key});

  @override
  State<PaytabelTopNavMoney> createState() => _PaytabelTopNavMoneyState();
}

class _PaytabelTopNavMoneyState extends State<PaytabelTopNavMoney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        children: [
          SizedBox(height: ScreenUtil().statusBarHeight + 10.h),
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24.h),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    'THE PATH TO PARTBER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
