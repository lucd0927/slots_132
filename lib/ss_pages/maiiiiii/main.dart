import 'package:flutter/material.dart' hide Velocity;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/bottom_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/contetti.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/newton.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/cycle_roller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/top_view.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(MainController());
    bgMusic.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainView(),
    );
  }

  Widget mainView() {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.mainBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(

            child:SSContetti(),
          ),
          Column(
            children: [
              TopView(),
              avatarWidget(),
              Expanded(child: CenterView()),
              BottomView(),
            ],
          ),




        ],
      ),
    );
  }



  avatarWidget() {
    List<Widget> children = [];

    for (int i = 0; i < 100; i++) {
      Widget item = avatarItem(index: i);
      children.add(item);
    }

    return Container(
      width: double.infinity,
      height: 60.h,
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  avatarItem({required int index}) {
    double height = 48.h;
    double width = 40.h;
    if (index == 0) {
      height = 62.h;
      width = 52.w;
    }
    return Container(
      width: width,
      height: height,
      // color: Colors.red,
      margin: EdgeInsets.only(right: 20.w),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                Assets.img.avatar.avatar1.path,
                width: width,
                height: width,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                Assets.img.avatarBg.path,
                width: width,
                height: width,
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: width,
              height: width * 13 / 43,
              // color: Colors.red,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.img.avatarBottom.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Text(
                      "xxxx",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xffffffff),
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



}
