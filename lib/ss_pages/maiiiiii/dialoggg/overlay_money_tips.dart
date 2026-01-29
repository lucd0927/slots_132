import 'dart:async';

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

class OverlayMoneyTips {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show({required BuildContext context}) {
    // if (_isShowing) return;
    ssLogggg("===OverlayMoneyTips==show==");
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return MainTopMoneyTipsWidget(
          onClose: () {
            close();
          },
        );
      },
    );
    // Overlay.of(Get.context!).insert(_overlay!);
    Overlay.of(context, rootOverlay: true).insert(_overlay!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
  }
}

class MainTopMoneyTipsWidget extends StatefulWidget {
  const MainTopMoneyTipsWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<MainTopMoneyTipsWidget> createState() => _MainTopMoneyTipsWidgetState();
}

class _MainTopMoneyTipsWidgetState extends State<MainTopMoneyTipsWidget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });

      _timer = Timer(Duration(milliseconds: 4000), () {

        onClose();
      });
    });
  }

  onClose() async {
    _timer?.cancel();
    if(mounted){
      setState(() {
        showAnimated = false;
        startScale = 1.0;
      });
    }

    await Future.delayed(animD);

    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    double left =
        MainController.minWithdddMoney - MainController.to.curMonnnn.value;
    if (left <= 0) {
      left = 0;
    }

    return Stack(
      children: [
        Positioned(
          left: 20.w,
          top: 80.h,
          child: AnimatedScale(
            duration: animD,
            // offset: showAnimated ? Offset.zero : Offset(0, -1),
            // opacity: showAnimated ? 1 : 0,
            scale: showAnimated ? 1 : 0,
            alignment: Alignment(-0.6, -0.7),
            child: GestureDetector(
              onTap: onClose,
              child: Material(
                color: Colors.teal.withValues(alpha: 0.0),
                child: Container(
                  width: 229.w,
                  height: 55.w,
                  color: Colors.red.withValues(alpha: 0.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.img.mainTopMoneyLefttips.path,
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
                            horizontal: 10.w,
                            vertical: 0.h,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SSABChange.isPackageB()
                                ? Text.rich(
                                    TextSpan(
                                      text:
                                          "${SSCountry.curGuojiaFuhao()} ${left.toStringAsFixed(2)}",
                                      children: [
                                        TextSpan(
                                          text: "  ${"money_tip_1".tr}.",
                                          style: TextStyle(
                                            color: Color(0xffFFFF8B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Color(0xff6AFF00),
                                      fontFamily: FontFamily.ghostKidAOEPro,
                                    ),
                                  )
                                : Text(
                                    "  ${"money_tip_2".tr}: ${MainController.to.curMonnnn.value.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Color(0xffDDDDDD),
                                      fontFamily: FontFamily.ghostKidAOEPro,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
