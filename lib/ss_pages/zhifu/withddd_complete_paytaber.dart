import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class WithdddCompletePaytaber extends StatefulWidget {
  const WithdddCompletePaytaber({super.key});

  @override
  State<WithdddCompletePaytaber> createState() =>
      _WithdddCompletePaytaberState();
}

class _WithdddCompletePaytaberState extends State<WithdddCompletePaytaber> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.white,
        
        gradient: LinearGradient(colors: [
          Color(0xff0E4D42),
          Color(0xff0C6A5D),
        ])
        ),
        child: Stack(
          children: [
            Image.asset(
              Assets.img.txlastbg.path,
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                PaytabelTopNavMoney(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 0.h,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffffffff).withValues(alpha: .2),
                          border: Border.all(
                            color: Color(0xffffffff).withValues(alpha: .5),
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Future Earnings",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffFED946),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      SSTxtGraBorder(
                        text: "\$1,000/day",
                        fontSize: 48.sp,
                        gradient: LinearGradient(
                          colors: [Color(0xffFFFFFF), Color(0xffFFD900)],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Unlock Partner Status to guarantee this income.",
                        style: TextStyle(
                          fontSize: 13.sp,
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
                        Container(
                          width: 140.h,
                          height: 140.h,
                          decoration: BoxDecoration(
                            color: Color(0xff37343E),
                            borderRadius: BorderRadius.circular(140.h),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "REACH LEVEL",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: Color(0xffE0E0E0),
                                  ),
                                ),
                                Text(
                                  "100",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 50.sp,
                                    height: 1,
                                    color: Color(0xffFFD500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 12.h),
                        Image.asset(
                          Assets.img.oneLastCheckOver.path,
                          width: 316.w,
                          height: 127.h,
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 323.w,
                          child: Row(
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: "Lv ",
                                  children: [
                                    TextSpan(
                                      text: "${MainController.to.level()}",
                                      style: TextStyle(
                                        color: Color(0xff3325FF),
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Target:100",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff8A8E99),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SSProjjjj(
                          height: 18.h,
                          innerHeight: 16.h,
                          width: 323.w,
                          progress: 0.5,
                          gradientColors: [
                            Color(0xff23FFB6),
                            Color(0xff23FFB6),
                          ],
                          bgColor: Color(0xff353C55),
                        ),
                        SizedBox(height: 2.h),
                        Container(
                          width: 323.w,
                          padding: EdgeInsets.symmetric(horizontal: 0.w),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "You are 45% of the way there. Keep going!",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff6B6B6B),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        GestureDetector(
                          onTap: () {
                            SSEventReporttttt.partner_yes();
                            Navigator.maybePop(context);
                          },
                          child: Container(
                            width: 230.h,
                            height: 42.h,
                            decoration: BoxDecoration(
                              // color: Color(0xff164CFF),
                              color: Color(0xff0E5B43),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Claim 24h of Double XP!",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: FontFamily.interBold,
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
                    '',
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
