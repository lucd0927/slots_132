import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class OverlayExp {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.teal.withValues(alpha: 0),
          child: ExpWidget(
            onClose: () {
              close();
            },
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class ExpWidget extends StatefulWidget {
  const ExpWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<ExpWidget> createState() => _ExpWidgetState();
}

class _ExpWidgetState extends State<ExpWidget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  onClose() async {
    setState(() {
      showAnimated = false;
      startScale = 1.0;
    });
    await Future.delayed(animD);

    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.green.withValues(alpha: 0),
        child: Stack(
          children: [
            Positioned(
              right: 40.w,
              top: 90.h,
              child: AnimatedScale(
                duration: animD,
                // offset: showAnimated ? Offset.zero : Offset(0, -1),
                // opacity: showAnimated ? 1 : 0,
                scale: showAnimated ? 1 : 0,
                alignment: Alignment(0.7, -1.0),
                child: Container(
                  width: 296.w,
                  height: 92.w,
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.img.exp.path,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 14.h,
                        bottom: 2.h,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.green.withValues(alpha: 0.0),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${MainController.to.allLevelExp(MainController.to.level() + 1) - MainController.to.curLevelExp.value} ${"exp_1".tr} ${MainController.to.level() + 1}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Color(0xffFFFF8B),
                                  fontFamily: FontFamily.ghostKidAOEPro,
                                ),
                              ),

                              Row(
                                children: [
                                  // Image.asset(
                                  //   Assets.img.money.path,
                                  //   width: 30.w,
                                  //   height: 28.w,
                                  // ),
                                  // SizedBox(width: 8.w),
                                  Text(
                                    SSABChange.isPackageB()
                                        ? "${"exp_2".tr} ${MainController.to.level()}/100 • ${"exp_3".tr} ${SSCountry.curGuojiaFuhao()}1,000/${"exp_4".tr}"
                                        : "${"exp_5".tr} ${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Color(0xffDDDDDD),
                                      fontFamily: FontFamily.ghostKidAOEPro,
                                    ),
                                  ),
                                  // Spacer(),
                                  // SSTxtGraBorder(
                                  //   text:
                                  //       "${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
                                  //   fontSize: 16.sp,
                                  //   fontWeight: FontWeight.w500,
                                  //   strokeColor: Color(0xff0D141B),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
