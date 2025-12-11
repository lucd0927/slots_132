import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/activate_my_status.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_buzu.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class TabBalance extends StatefulWidget {
  const TabBalance({super.key});

  @override
  State<TabBalance> createState() => _TabBalanceState();
}

class _TabBalanceState extends State<TabBalance> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double money = MainController.to.curMonnnn.value;
      String strMonnn =
          "${SSCountry.curGuojiaFuhao()} ${money.toStringAsFixed(2)}";
      if (money > 1000) {
        int quzheng = money ~/ 1000;
        double tpmMmmm2 = money - quzheng * 1000;
        strMonnn =
            "${SSCountry.curGuojiaFuhao()} ${quzheng},${tpmMmmm2.toStringAsFixed(2)} USD";
      }

      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Cash Balance',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: onToggle,
                  child: Icon(
                    WithdddController.to.showBalance.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 18.h,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  WithdddController.to.currentPaymentIconSelected(),
                  width: 120.h,
                  height: 30.h,
                ),
              ],
            ),
            SizedBox(height: 8.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SSAniiiiCount(
                value: money,
                prefix: "${SSCountry.curGuojiaFuhao()}",
                suffix: " USD",
                fractionDigits: 2,
                textStyle: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2F2F2F),
                ),
              ),
            ),
            SizedBox(height: 8.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onAdd,

                  child: Container(
                    width: 132.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E4EA),
                      borderRadius: BorderRadius.circular(32.h),
                    ),
                    child: Center(
                      child: Text(
                        "Add money",
                        style: TextStyle(
                          fontFamily: FontFamily.rubik,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onWithdraw,

                  child: Container(
                    width: 132.w,
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
          ],
        ),
      );
    });
  }

  void onToggle() {
    WithdddController.to.showBalance.value =
        !WithdddController.to.showBalance.value;
  }

  void onAdd() {
    // OverlayWithddBuzu().show();
    // OverlayJindu1().show();
    SSEventReporttttt.cash_out_page_add();
    Navigator.maybePop(context);
  }

  void onWithdraw() {
    SSEventReporttttt.cash_out_page_withdraw();
    ssLogggg("===onWithdraw==");
    WithdddController.to.onWithdraw(money: MainController.minWithdddMoney);
  }
}
