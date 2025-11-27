import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// 修改点：在文件顶部加入以下 import
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/restore_bottom_bar.dart';
import 'package:slots_132/ss_common/routes.dart';
import 'package:slots_132/ss_pages/zhifu/viewwww/tab_balance.dart';
import 'package:slots_132/ss_pages/zhifu/viewwww/tab_nav.dart';
import 'package:slots_132/ss_pages/zhifu/viewwww/tab_view.dart';
import 'package:slots_132/ss_pages/zhifu/viewwww/top_nav_money.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class Withdrawwwww extends StatefulWidget {
  const Withdrawwwww({super.key});

  @override
  State<Withdrawwwww> createState() => _WithdrawwwwwState();
}

class _WithdrawwwwwState extends State<Withdrawwwww> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SSEventReporttttt.cash_out_page();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: WithdddController.to.bgColor(),
        // extendBody: true,
        body: DefaultTextStyle(
          style: TextStyle(
            fontFamily: FontFamily.rubik,
            color: Color(0xff2F2F2F),
          ),
          child: Column(
            children: [
              // Top blue area with chips and main card
              Container(
                // color: const Color(0xFF263DD9),
                child: Column(
                  children: [
                    TopNavMoney(),
                    SizedBox(height: 12.h),
                    TabNav(),
                    const SizedBox(height: 16),
                    // big balance card
                    TabBalance(),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffE7EEF3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.h),
                      topRight: Radius.circular(16.h),
                    ),
                  ),
                  child: SSTabView(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemUiHelper.restoreTransparentNavBar();
  }
}
