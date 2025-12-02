import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_common/sssssp/spine_txlast.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu3.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddJindu2 {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    SSEventReporttttt.transaction_fee_pop();
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithddJindu2(
          onClose: () {
            close();

            OverlayWithddJindu3().show();
          },
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

class WithddJindu2 extends StatefulWidget {
  const WithddJindu2({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<WithddJindu2> createState() => _WithddJindu2State();
}

class _WithddJindu2State extends State<WithddJindu2> {
  bool showAnimated = false;
  bool showAnimatedTxt = false;
  Duration animD = Duration(milliseconds: 250);
  Duration animD2 = Duration(milliseconds: 5000);
  Duration animD3 = Duration(milliseconds: 2000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
      Future.delayed(animD2, () {
        if (mounted) {
          setState(() {
            showAnimatedTxt = true;
          });

          Future.delayed(animD3, () {
            onClose();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
        child: Center(
          child: AnimatedScale(
            duration: animD,
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            scale: showAnimated ? 1.0 : 0.8,
            // curve: Curves.linearToEaseOut,
            child: Stack(
              children: [
                !showAnimatedTxt
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 324.w,
                            height: 388.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 1.0),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 20.h),
                                        Text(
                                          "( ! )Transaction Fee Required",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        SizedBox(height: 30.h),

                                        Image.asset(
                                          Assets.img.txPopupJindu2.path,
                                          width: 166.h,
                                          height: 137.h,
                                        ),

                                        SizedBox(height: 30.h),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              text:
                                                  "To complete your \$1000 withdrawal, a \$10.00 fee is required by the ",
                                              children: [
                                                TextSpan(
                                                  text: "bank.",
                                                  style: TextStyle(
                                                    color: Color(0xffFE0707),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: Color(0xff2E313A),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),

                                        SizedBox(height: 40.h),

                                        GestureDetector(
                                          onTap: () {
                                            if (mounted) {
                                              setState(() {
                                                showAnimatedTxt = true;
                                              });

                                              Future.delayed(animD3, () {
                                                onClose();
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: 230.h,
                                            height: 42.h,
                                            decoration: BoxDecoration(
                                              color: Color(0xff31C520),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Pay \$10.00 Fee to Continue",
                                                style: TextStyle(
                                                  color: Color(0xffffffff),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SSSpineTxLast(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    if (mounted) {
      setState(() {
        showAnimated = false;
      });
      await Future.delayed(animD);
      widget.onClose();
    }
  }
}
