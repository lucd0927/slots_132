import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/country.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_scale.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';
import 'package:slots_132/ss_pages/bonus_game/bonus_game_controller.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus_controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';

class OverlayBonusGame {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;

  void show() {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return BonusGameWidget(
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

class BonusGameWidget extends StatefulWidget {
  const BonusGameWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<BonusGameWidget> createState() => _BonusGameWidgetState();
}

class _BonusGameWidgetState extends State<BonusGameWidget> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(BonusGameController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: animD,
          color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent.withValues(alpha: 0.0),
            child: Stack(
              children: [
                Image.asset(
                  Assets.img.bonusGameBg.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                AnimatedScale(
                  duration: animD,
                  // offset: showAnimated ? Offset.zero : Offset(0, 1),
                  scale: showAnimated ? 1.0 : 0.8,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.blueAccent.withValues(alpha: 0.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        topWidget(),
                        SizedBox(height: 10.h),
                        buildCenterWidget(),
                        SizedBox(height: 24.h),
                        Expanded(child: Center(child: bottomWidget())),

                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),

                closeWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildCenterWidget() {
    return Column(
      children: [
        jackpotItemGrand(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [jackpotItemMajor(), jackpotItemMini()],
        ),
      ],
    );
  }

  Widget jackpotItemBottomSelect({
    required String cardCategory
}){
    int count =
        BonusGameController.to.categoryCount[cardCategory] ??
            0;
    List<Widget> itemDdd = [];
    for (int i = 0; i < 3; i++) {
      String icon = Assets.img.bonusGameNoSelect.path;
      if (i < count) {
        if(cardCategory == BonusGameController.card_grand){
          icon = Assets.img.bonusGameGrandSelect.path;
        }else  if(cardCategory == BonusGameController.card_major){
          icon = Assets.img.bonusGameMajorSelect.path;
        }else  if(cardCategory == BonusGameController.card_mini){
          icon = Assets.img.bonusGameMiniSelect.path;
        }


      }
      // icon = Assets.img.bonusGameGrandSelect.path;

      Widget icon1 = Image.asset(icon, width: 8.h, height: 8.h);
      itemDdd.add(icon1);
    }

    Widget bottomW = Container(
      width: 180.h,
      height: 10.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.img.bonusGameJackpotSelectBg.path),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemDdd[0],
          SizedBox(width: 10.h),
          itemDdd[1],
          SizedBox(width: 10.h),
          itemDdd[2],
        ],
      ),
    );
    return bottomW;
  }

  jackpotItemGrand() {
    String symbol = SSCountry.curGuojiaFuhao();
    String grandMoney = "${symbol}${MainController.jacktopGrand}";


    Widget bottomW = jackpotItemBottomSelect(cardCategory: BonusGameController.card_grand);

    return Container(
      width: 180.h,
      height: 74.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.bonusGameGrand.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Positioned(
            left: 28.h,
            right: 20.h,
            bottom: 20.h,
            child: Container(
              width: double.infinity,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.0),
              ),
              child: Center(
                child: SSTxtGraBorder(
                  text: grandMoney,
                  // fontFamily: FontFamily.rubik,
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xff0FFF63),
                      Color(0xffA4F00D),
                      Color(0xffD0FF00),
                      Color(0xff00FF1E),
                    ],
                  ),
                  fontSize: 20.sp,
                  strokeColor: Color(0xff0C402B),
                ),
              ),
            ),
          ),

          Positioned(left: 0, right: 0, bottom: 6.h, child: bottomW),
        ],
      ),
    );
  }

  jackpotItemMajor() {
    String symbol = SSCountry.curGuojiaFuhao();
    String grandMoney = "${symbol}${MainController.jacktopMajor}";
    Widget bottomW = jackpotItemBottomSelect(cardCategory: BonusGameController.card_major);
    return Container(
      width: 150.h,
      height: 67.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.bonusGameMajor.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Positioned(
            left: 28.h,
            right: 10.h,
            bottom: 14.h,
            child: Container(
              width: double.infinity,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.0),
              ),
              child: Center(
                child: SSTxtGraBorder(
                  text: grandMoney,
                  // fontFamily: FontFamily.rubik,
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xff0FFF63),
                      Color(0xffA4F00D),
                      Color(0xffD0FF00),
                      Color(0xff00FF1E),
                    ],
                  ),
                  fontSize: 20.sp,
                  strokeColor: Color(0xff0C402B),
                ),
              ),
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 6.h, child: bottomW),
        ],
      ),
    );
  }

  jackpotItemMini() {
    String symbol = SSCountry.curGuojiaFuhao();
    String grandMoney = "${symbol}${MainController.jacktopMini}";
    Widget bottomW = jackpotItemBottomSelect(cardCategory: BonusGameController.card_mini);
    return Container(
      width: 150.h,
      height: 67.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.bonusGameMini.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          Positioned(
            left: 28.h,
            right: 10.h,
            bottom: 14.h,
            child: Container(
              width: double.infinity,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.0),
              ),
              child: Center(
                child: SSTxtGraBorder(
                  text: grandMoney,
                  // fontFamily: FontFamily.rubik,
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xff0FFF63),
                      Color(0xffA4F00D),
                      Color(0xffD0FF00),
                      Color(0xff00FF1E),
                    ],
                  ),
                  fontSize: 20.sp,
                  strokeColor: Color(0xff0C402B),
                ),
              ),
            ),
          ),
          Positioned(left: 0, right: 0, bottom: 6.h, child: bottomW),
        ],
      ),
    );
  }

  double itemWidth = 86.w;
  double itemHeight = 103.h;

  bottomWidget() {
    List<Widget> icons = [];
    List<String> data = BonusGameController.to.data;

    for (int i = 0; i < data.length; i++) {
      Widget tmpItem = bottomItemWidget(category: data[i], index: i);
      icons.add(tmpItem);
    }
    double spacing = 20.w;
    double runSpacing = 20.h;
    double width = itemWidth * 3 + spacing * 3;
    double height = itemHeight * 3 + runSpacing * 3;
    double borderWidth = 2.w;
    Color borderColor = Color(0xff950605);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xff370A0A).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: itemHeight + runSpacing - borderWidth / 2,
            child: Container(
              width: double.infinity,
              height: borderWidth,
              decoration: BoxDecoration(color: Color(0xff950605)),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: itemHeight * 2 + runSpacing * 2 - borderWidth / 2,
            child: Container(
              width: double.infinity,
              height: borderWidth,
              decoration: BoxDecoration(color: Color(0xff950605)),
            ),
          ),

          Positioned(
            left: itemWidth + spacing - borderWidth / 2,
            bottom: 0,
            top: 0,
            child: Container(
              height: double.infinity,
              width: 2.w,
              decoration: BoxDecoration(color: Color(0xff950605)),
            ),
          ),

          Positioned(
            left: itemWidth * 2 + spacing * 2 - borderWidth / 2,
            bottom: 0,
            top: 0,
            child: Container(
              height: double.infinity,
              width: 2.w,
              decoration: BoxDecoration(color: Color(0xff950605)),
            ),
          ),

          Wrap(spacing: spacing, runSpacing: runSpacing, children: icons),
        ],
      ),
    );
  }

  bottomItemWidget({required String category, required int index}) {
    Set<int> containIndexes = BonusGameController.to.clickIndex;

    String icon = Assets.img.bonusGameCardBack.path;
    bool contain = containIndexes.contains(index);
    if (contain || true) {
      icon =
          BonusGameController.kCardCategory_vCardImg[category] ??
          Assets.img.bonusGameCardBack.path;
    }
    String find3 = BonusGameController.to.find3SameCard.value;
    bool showAnimScale = false;
    if (find3.isNotEmpty) {
      showAnimScale =
          find3 == category || category == BonusGameController.card_scatter;
      showAnimScale = showAnimScale && contain;
    }
    // ssLogggg("=====showAnimScale:$showAnimScale category:$category index:$index",);

    Widget child = Image.asset(
      icon,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );

    return Container(
      width: itemWidth,
      height: itemHeight,
      color: Colors.transparent,
      child: Stack(
        children: [
          showAnimScale
              ? SSAScale(child: child)
              : FlipCard(
                  onFlipEnd: () {
                    BonusGameController.to.addClickIndex(index);
                  },
                  front: Image.asset(
                    Assets.img.bonusGameCardBack.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  back: child,
                ),
        ],
      ),
    );
  }

  closeWidget() {
    return Positioned(
      top: 50.h,
      left: 20.w,
      child: GestureDetector(
        onTap: onClose,
        child: Image.asset(
          Assets.img.btnBack.path,
          width: 42.w,
          height: 27.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  onClose() async {
    ssLogggg("====== close");

    widget.onClose();
  }

  topWidget() {
    return Container(
      width: 168.h,
      height: 106.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.bonusGameLucky.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  topGiftDay({required String icon, required int day}) {
    int tmpWeeks = DailyBonusController.to.continueLoginWeeks.value;
    int tmpDays = DailyBonusController.to.continueLoginDays.value;

    int tmpCurDay = tmpDays + tmpWeeks * 7;

    bool hasGet = tmpCurDay >= day;

    // hasGet = true;
    return Container(
      width: 50.h,
      height: 70.h,
      color: Colors.teal.withValues(alpha: 0.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(icon, width: 44.h, height: 44.h, fit: BoxFit.contain),
              // SizedBox(height: 4.h),
              Container(
                width: 22.h,
                height: 22.h,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.img.dailyBonusGiftday.path,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Center(
                      child: SSTxtBorder(
                        text: "$day",
                        fontSize: 9.sp,
                        strokeWidth: 0.5.w,
                        foreground: Color(0xff8A2F2F),
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (hasGet)
            Positioned(
              right: 8.w,
              top: 4.h,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.0),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.img.dailyBonusOk.path,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<BonusGameController>();
    super.dispose();
  }
}

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final VoidCallback onFlipEnd;

  const FlipCard({
    super.key,
    required this.front,
    required this.back,
    required this.onFlipEnd,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void _flip() {
    if (_isFront) {
      _controller.forward().then((v) {
        widget.onFlipEnd();
      });
    } else {
      // _controller.reverse();
    }
    // _isFront = !_isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (_, __) {
          final angle = _animation.value * pi;

          // 判断是前面还是后面
          final isFront = angle <= pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002) // 透视效果
              ..rotateY(angle),
            child: isFront
                ? widget.front
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: widget.back,
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
