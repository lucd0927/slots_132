import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheee_bottom.dart';
import 'package:slots_132/ss_pages/wheeee/vieee/wheel_detail.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class Wheeee extends StatefulWidget {
  const Wheeee({super.key});

  @override
  State<Wheeee> createState() => _WheeeeState();
}

class _WheeeeState extends State<Wheeee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              Assets.img.wheelBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withValues(alpha: 0.0),
            ),

            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  Obx((){
                    bool hasOver = WheController.to.wheelEnd.value;
                    return Image.asset(
                      hasOver?Assets.img.wheelTitleCongrats.path:  Assets.img.wheelTitle.path,
                      width: 333.w,
                      height: 165.w,
                      fit: BoxFit.fill,
                      gaplessPlayback: true,
                    );
                  }),
                  SSWheelDetail(
                    onEnd: (value) {
                      WheController.to.onSpinSub(value);
                    },
                  ),
                  WheeeBottom(),
                ],
              ),
            ),

            Positioned(
              top: 50.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.img.btnBack.path,
                  width: 42.w,
                  height: 27.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
