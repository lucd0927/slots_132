import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/zhifu/dialoooo/withddd_jindu2.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_controller.dart';

class OverlayJindu1 {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithdddJindu1(
          onClose: () {
            close();
            OverlayWithddJindu2().show();


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

class WithdddJindu1 extends StatefulWidget {
  const WithdddJindu1({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<WithdddJindu1> createState() => _WithdddJindu1State();
}

class _WithdddJindu1State extends State<WithdddJindu1> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 250);
  Duration animD2 = Duration(milliseconds: 1500);
  bool showJindu2 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
      }

      Future.delayed(Duration(milliseconds: 400), () {
        if (mounted) {
          setState(() {
            showJindu2 = true;
          });

          Future.delayed(Duration(milliseconds: 2000), () {
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
          child: AnimatedSlide(
            duration: animD,
            // scale: showAnimated ? 1.0 : 0.8,
            offset: showAnimated ? Offset.zero : Offset(0, 1),
            child: Column(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 16.h),
                            Text(
                              "Sending Your \$50.00 Payout...",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            jinduWidget(),

                            SizedBox(height: 10.h),
                            Text(
                              "Verifying transaction... Please wait.",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            jindu2Widget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                GestureDetector(
                    onTap: onClose,
                    child: Image.asset(Assets.img.closePopup.path,width: 30.h,height: 30.h,))
              ],
            ),
          ),
        ),
      ),
    );
  }

  jindu2Widget() {
    String time = DateFormat().format(DateTime.now());
    return Container(
      width: 305.w,
      height: 158.h,
      decoration: BoxDecoration(
        color: Color(0xffE8F4FF),
        borderRadius: BorderRadius.circular(12.w),
        border: Border.all(color: Color(0xffDCE5FF), width: 1.w),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(width: 16.w),

                  Image.asset(
                    Assets.img.txPopupSelect.path,
                    width: 21.w,
                    height: 21.h,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    Assets.img.txPopupTips2.path,
                    width: 38.w,
                    height: 33.h,
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Out app",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff596775),
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff90A2B4),
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 25.w),
                  Container(height: 16.h, width: 1.w),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 12.w),

                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.img.txPopupBankJindu.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 4.w),
                          Container(
                            width: 21.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              color: Color(0xff1937D1),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.h),
                                DotsWave(color: Colors.white, size: 4.w),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Image.asset(
                            Assets.img.txPopupBank.path,
                            width: 38.w,
                            height: 33.h,
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The bank is reviewing. Please wait.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000),
                                    fontSize: 10.sp,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff90A2B4),
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 16.h),
              Row(
                children: [
                  SizedBox(width: 16.w),

                  Image.asset(
                    Assets.img.txPopupMore.path,
                    width: 21.w,
                    height: 21.h,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    Assets.img.txPopupMoney.path,
                    width: 38.w,
                    height: 33.h,
                  ),
                  SizedBox(width: 8.w),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Withdrawal Credited \$50.00",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff596775),
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff90A2B4),
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 24.w),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: showJindu2 ? 1.0 : 0),
                    duration: animD2,
                    builder:
                        (BuildContext context, double? value, Widget? child) {
                          value ??= 0.0;
                          return Container(
                            height: 22.h * value,
                            width: 4.w,
                            decoration: BoxDecoration(color: Color(0xffAEB0B2)),
                          );
                        },
                  ),

                  Container(
                    height: 22.h,
                    width: 1.w,
                    decoration: BoxDecoration(
                      color: Color(0xffAEB0B2).withValues(alpha: 0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33.h),
              Row(
                children: [
                  SizedBox(width: 24.w),
                  Container(
                    height: 22.h,
                    width: 4.w,
                    decoration: BoxDecoration(color: Color(0xffAEB0B2)),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  jinduWidget() {
    double width = 125.h;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: showJindu2 ? 1.0 : 0),
      duration: animD2,
      builder: (BuildContext context, double? value, Widget? child) {
        value ??= 0;
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(color: Colors.teal.withValues(alpha: 0.0)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircularPercentIndicator(
                radius: width / 2,
                animation: false,
                lineWidth: 8.w,
                percent: value ?? 0,

                backgroundColor: Colors.grey,
                progressColor: Color(0xff1937D1),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),

                    Image.asset(
                      WithdddController.to.currentPaymentIconSelected(),
                      width: 85.h,
                      height: 34.w,
                    ),
                    Text(
                      MainController.to.minWithdddMoneyWithCountry,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xff000000),
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "${value * 100 ~/ 1}%",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xff5347FF),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  onClose() async {
    ssLogggg("======Setting close");
    setState(() {
      showAnimated = false;
    });
    await Future.delayed(animD);
    widget.onClose();
  }
}

class DotsWave extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  const DotsWave({
    super.key,
    this.color = Colors.blueAccent,
    this.size = 8.0,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  State<DotsWave> createState() => _DotsWaveState();
}

class _DotsWaveState extends State<DotsWave>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final progress = (_controller.value + i * 0.2) % 1.0;
            final offset = (progress < 0.5)
                ? progress * 2
                : (1 - progress) * 2; // 上下波动
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.5.w),
              child: Transform.translate(
                offset: Offset(0, -offset * 4),
                child: child,
              ),
            );
          },
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
