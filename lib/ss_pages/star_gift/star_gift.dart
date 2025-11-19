import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/ss_pages/star_gift/map_view.dart';


class StarGift extends StatefulWidget {
  const StarGift({super.key});

  @override
  State<StarGift> createState() => _StarGiftState();
}

class _StarGiftState extends State<StarGift> {
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
              Assets.img.giftBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(height: 210.h),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  color: Colors.blueAccent.withValues(alpha: 0.0),
                  child: Column(
                    children: [
                      SSTxtGraBorder(
                        text: "Casino Royale",
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        strokeColor: Color(0xffCC1420),
                        strokeWidth: 3.w,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                Assets.img.giftCenterTxtBg.path,
                                width: 200.w,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Center(
                              child: SSTxtGraBorder(
                                text: "Endless Treasure",
                                fontSize: 16.sp,
                                fontFamily: FontFamily.rubik,
                                fontWeight: FontWeight.w700,
                                strokeColor: Color(0xff30120A),
                                strokeWidth: 1.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SSMapView(),
                ),
                SizedBox(height: 50.h),
              ],
            ),

            Positioned(
              top: 50.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.maybePop(context);
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
