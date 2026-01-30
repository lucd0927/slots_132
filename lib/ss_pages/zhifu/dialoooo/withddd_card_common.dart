import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/num_e.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_onelc_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayWithddCardCommon {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return _WithddCardCommonWidget(
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

class _WithddCardCommonWidget extends StatefulWidget {
  const _WithddCardCommonWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<_WithddCardCommonWidget> createState() =>
      _WithddCardCommonWidgetState();
}

class _WithddCardCommonWidgetState extends State<_WithddCardCommonWidget>
    with WidgetsBindingObserver {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Timer? _timer;

  final FocusNode focusNode = FocusNode();
  late VoidCallback focusListener;

  final FocusNode focusNode2 = FocusNode();
  late VoidCallback focusListener2;

  final FocusNode focusNode3 = FocusNode();
  late VoidCallback focusListener3;

  final FocusNode focusNode4 = FocusNode();
  late VoidCallback focusListener4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        if (mounted) {
          focusNode.requestFocus();
        }
      });
    });
    focusListener = () {
      _listener(focusNode);
    };
    focusListener2 = () {
      _listener(focusNode2);
    };
    focusListener3 = () {
      _listener(focusNode3);
    };
    focusListener4 = () {
      _listener(focusNode4);
    };

    focusNode.addListener(focusListener);
    focusNode2.addListener(focusListener2);
    focusNode3.addListener(focusListener3);
    focusNode4.addListener(focusListener4);
  }

  double topHeight = 0.h;
  String focusNodeTxt = "";
  String focusNodeTxt2 = "";
  String focusNodeTxt3 = "";

  _listener(FocusNode focusNode) {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
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
                    height: inputHeight(),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 1.0),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 12.h),

                        Image.asset(
                          WithdddController.to.currentPaymentIconSelected(),
                          width: 167.h,
                          height: 43.h,
                        ),

                        SizedBox(height: 12.h),

                        payTypeInput(),

                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: onWithdrawwww,
                          child: Container(
                            width: 230.h,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: WithdddController.to.bgColor(),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "${"card_bank_2".tr} ${SSCountry.curGuojiaFuhao()}${MainController.minWithdddMoney.toStringAsFixed(2)}",
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
                            Text(
                              "Cancel".tr,
                              style: TextStyle(
                                color: Color(0xff7E8E9B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  GestureDetector(
                    onTap: onClose,
                    child: Image.asset(
                      Assets.img.closePopup.path,
                      width: 30.h,
                      height: 30.h,
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: topHeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(str);
  }

  void onWithdrawwww() {
    String cardNumber = "";
    bool hasOk = true;
    if (WithdddController.to.selectedPaymentBank.value ==
        EnumSSPaymentMethod.ovo.name) {
      cardNumber = focusNodeTxt2;
      if (focusNodeTxt.isEmpty && focusNodeTxt2.isEmpty) {
        hasOk = false;
      }
    } else if (WithdddController.to.selectedPaymentBank.value ==
        EnumSSPaymentMethod.dana.name) {
      cardNumber = focusNodeTxt;
      if (focusNodeTxt.isEmpty) {
        hasOk = false;
      }
    } else if (WithdddController.to.selectedPaymentBank.value ==
        EnumSSPaymentMethod.pagbank.name) {
      cardNumber = focusNodeTxt;
      if (focusNodeTxt.isEmpty) {
        hasOk = false;
      }
    } else if (WithdddController.to.selectedPaymentBank.value ==
        EnumSSPaymentMethod.pix.name) {
      cardNumber = focusNodeTxt3;
      if (focusNodeTxt.isEmpty &&
          focusNodeTxt2.isEmpty &&
          focusNodeTxt3.isEmpty) {
        hasOk = false;
      }
    }
    if (!hasOk) {
      ssTushi(text: "card_cashapp_4".tr);
      return;
    }

    WithdddController.to.saveCardId(cardNumber);

    onClose();
  }

  inputCardNumberWidget({
    required String hintText,
    required String title,
    required FocusNode focusNode,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff252525),
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: 285.w,
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Color(0xffEDF0F7),
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(color: Color(0xffEAEBEF), width: 1.w),
          ),
          child: Row(
            children: [
              // Icon(Icons.credit_card, color: Color(0xff6B7280)),
              SizedBox(width: 8.w),
              Expanded(
                child: Center(
                  child: TextField(
                    focusNode: focusNode,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B7280),
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B7280),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    onChanged: (text) {
                      ssLogggg("===input text:$text===");
                      onChanged(text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
      // focusNode.requestFocus();
    } else if (bottomInset == 0 && _keyboardHeight > 0) {
      print('🎯 键盘收起');
      // focusNode.unfocus();
      FocusScope.of(context).unfocus();
    }
    _keyboardHeight = bottomInset;
    ssLogggg("===_keyboardHeight:$_keyboardHeight===");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNode.removeListener(focusListener);
    focusNode.dispose();
    super.dispose();
  }

  double inputHeight() {
    double height = 300.h;
    String bankName = WithdddController.to.selectedPaymentBank.value;
    // bankName = EnumSSPaymentMethod.ovo.name;
    // bankName = EnumSSPaymentMethod.dana.name;
    // bankName = EnumSSPaymentMethod.pagbank.name;
    // bankName = EnumSSPaymentMethod.pix.name;
    if (bankName == EnumSSPaymentMethod.ovo.name) {
      height = 300.h;
    } else if (bankName == EnumSSPaymentMethod.dana.name) {
      height = 240.h;
    } else if (bankName == EnumSSPaymentMethod.pagbank.name) {
      height = 240.h;
    } else if (bankName == EnumSSPaymentMethod.pix.name) {
      height = 380.h;
    }
    return height;
  }

  Widget payTypeInput() {
    List<Widget> children = [];
    String bankName = WithdddController.to.selectedPaymentBank.value;
    // bankName = EnumSSPaymentMethod.ovo.name;
    // bankName = EnumSSPaymentMethod.dana.name;
    // bankName = EnumSSPaymentMethod.pagbank.name;
    // bankName = EnumSSPaymentMethod.pix.name;

    ssLogggg("====bankName:$bankName");
    if (bankName == EnumSSPaymentMethod.ovo.name) {
      children = [
        inputCardNumberWidget(
          title: "Name",
          hintText: "Please input full name",
          onChanged: (text) {
            focusNodeTxt = text;
          },
          focusNode: focusNode,
        ),
        SizedBox(height: 8.h),
        inputCardNumberWidget(
          title: "Account",
          hintText: "e.g.1234578",
          onChanged: (text) {
            focusNodeTxt2 = text;
          },
          focusNode: focusNode2,
        ),
      ];
    } else if (bankName == EnumSSPaymentMethod.dana.name) {
      children.add(
        inputCardNumberWidget(
          title: "Account",
          hintText: "e.g.1234578",
          onChanged: (text) {
            focusNodeTxt = text;
          },
          focusNode: focusNode,
        ),
      );
    } else if (bankName == EnumSSPaymentMethod.pagbank.name) {
      children.add(
        inputCardNumberWidget(
          title: "Account",
          hintText: "e.g.xx@gmail.com",
          onChanged: (text) {
            focusNodeTxt = text;
          },
          focusNode: focusNode,
        ),
      );
    } else if (bankName == EnumSSPaymentMethod.pix.name) {
      children = [
        inputCardNumberWidget(
          title: "CPF",
          hintText: "e.g. 99999999999",
          onChanged: (text) {
            focusNodeTxt = text;
          },
          focusNode: focusNode,
        ),
        SizedBox(height: 8.h),

        inputCardNumberWidget(
          title: "Name",
          hintText: "Please input full name",
          onChanged: (text) {
            focusNodeTxt2 = text;
          },
          focusNode: focusNode2,
        ),
        SizedBox(height: 8.h),

        inputCardNumberWidget(
          title: "Account",
          hintText: "e.g.xx@gmail.com",
          onChanged: (text) {
            focusNodeTxt3 = text;
          },
          focusNode: focusNode3,
        ),
      ];
    }

    return Column(children: children);
  }
}
