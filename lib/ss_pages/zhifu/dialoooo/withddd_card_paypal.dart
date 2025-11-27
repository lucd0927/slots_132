import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/num_e.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu1.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddCardPaypal {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return _WithddPaypalWidget(
          onClose: () {
            close();
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

class _WithddPaypalWidget extends StatefulWidget {
  const _WithddPaypalWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<_WithddPaypalWidget> createState() => _WithddPaypalWidgetState();
}

class _WithddPaypalWidgetState extends State<_WithddPaypalWidget>
    with WidgetsBindingObserver {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Timer? _timer;

  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();
  late VoidCallback focusListener;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
      // _timer = Timer(Duration(milliseconds: 5000), () {
      //
      //   onClose();
      // });
    });
    focusListener = () {
      _listener();
    };

    focusNode.addListener(focusListener);
  }

  double topHeight = 0.h;
  String name = "";

  _listener() {
    ssLogggg("==focusListeners:${focusNode.hasFocus}==");
    if (mounted) {
      setState(() {
        if (focusNode.hasFocus) {
          topHeight = 150.h;
        } else {
          topHeight = 0.h;
        }
      });
    }
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
            scale: showAnimated ? 1.0 : 0.8,
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            // curve: Curves.linearToEaseOut,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 324.w,
                  height: 434.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1.0),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 12.h),
                      Image.asset(
                        Assets.img.withddPaypal2.path,
                        width: 179.h,
                        height: 68.h,
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "Withdraw funds",
                        style: TextStyle(
                          color: Color(0xff252525),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Transfer funds instantly to your PayPal account.",
                          style: TextStyle(
                            color: Color(0xff7E8E9B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 285.w,
                        height: 48.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: Color(0xffEDF0F7),
                          borderRadius: BorderRadius.circular(8.w),
                          border: Border.all(
                            color: Color(0xffBCB9D2),
                            width: 0.5.w,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Withdrawal Amount",
                              style: TextStyle(
                                color: Color(0xff7E8E9B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Spacer(),
                            SSAniiiiCount(
                              value: MainController.to.curMonnnn.value
                                  .toAsFixedFloor(2),
                              prefix: SSCountry.curGuojiaFuhao(),
                              textStyle: TextStyle(
                                color: Color(0xff252525),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      inputWidget(),

                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: onWithdrawwww,
                        child: Container(
                          width: 230.h,
                          height: 42.h,
                          decoration: BoxDecoration(
                            color: Color(0xff31C520),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "Withdraw ${SSCountry.curGuojiaFuhao()}${MainController.minWithdddMoney.toStringAsFixed(2)}",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onClose,
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Color(0xff7E8E9B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  height: topHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onWithdrawwww() {

    if(name.isEmpty){
      ssTushi(text: "Please enter a valid card number.");
      return;
    }

    WithdddController.to.saveCardId(name);
    OverlayJindu1().show();
    onClose();



  }

  inputWidget() {
    return Container(
      width: 285.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Color(0xffEDF0F7),
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: Color(0xffEAEBEF), width: 1.w),
      ),
      child: Center(
        child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff000000),
          ),
          decoration: InputDecoration.collapsed(
            hintText: "PayPal email or mobile number",
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff6B7280),
            ),
          ),
          keyboardType: TextInputType.text,
          onChanged: (text) {
            ssLogggg("===input text:$text===");
            name = text;
          },
        ),
      ),
    );
  }

  onClose() async {
    _timer?.cancel();
    ssLogggg("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }

  double _keyboardHeight = 0;

  @override
  void didChangeMetrics() {
    // 获取键盘高度
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && _keyboardHeight == 0) {
      print('🧭 键盘弹起');
      focusNode.requestFocus();
    } else if (bottomInset == 0 && _keyboardHeight > 0) {
      print('🎯 键盘收起');
      focusNode.unfocus();
    }
    _keyboardHeight = bottomInset;
    ssLogggg("===_keyboardHeight:$_keyboardHeight===");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNode.removeListener(focusListener);
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }
}
