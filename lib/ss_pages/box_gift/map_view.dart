import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_widget/font_border.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/model/gift_reward_model.dart';

class SSMapView extends StatefulWidget {
  const SSMapView({super.key});

  @override
  State<SSMapView> createState() => _SSMapViewState();
}

class _SSMapViewState extends State<SSMapView> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _leftC;
  late ScrollController _rightC;
  late ScrollController _lineC;

  List<BoxGiftModel> leftData = [];
  List<BoxGiftModel> rightData = [];

  List<Widget> leftWidgetChildren = [];
  List<Widget> rightWidgetChildren = [];
  List<Widget> lineWidgetChildren = [];

  var box = SSHive.box;
  Map<int, GiftRewardModel> kStarNum_vReward = {
    3: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 25,
      img: Assets.img.moneyGift.path,
    ),
    6: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 200,
      img: Assets.img.giftXpUnlock.path,
    ),
    2: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 25,
      img: Assets.img.moneyGift.path,
    ),
    8: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.mainPhone.path,
    ),
    5: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.cash,
      num: 120,
      img: Assets.img.moneyGift.path,
    ),
    1: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.spin,
      num: 20,
      img: Assets.img.btnTxtSpin.path,
    ),
    9: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.mainPhone.path,
    ),
    4: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.spin,
      num: 100,
      img: Assets.img.btnTxtSpin.path,
    ),
    7: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.xp,
      num: 200,
      img: Assets.img.giftXpUnlock.path,
    ),
    10: GiftRewardModel(
      rewardModelType: EnumGiftRewardModel.iphoneCard,
      num: 1,
      img: Assets.img.mainPhone.path,
    ),
  };
  int jumpIndex = 0;
  int unlockMaxIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllers = LinkedScrollControllerGroup();
    _leftC = _controllers.addAndGet();
    _rightC = _controllers.addAndGet();
    _lineC = _controllers.addAndGet();
    init().then((_) {
      Future.delayed(Duration(milliseconds: 300),(){
        scrollTo(jumpIndex);
      });
    });
  }

  Future init() async {
    leftWidgetChildren = [];
    rightWidgetChildren = [];
    lineWidgetChildren = [];
    List<int> jumpToNextStar = kStarNum_vReward.keys.toList();
    int loopMaxN = 0;
    for (var v in jumpToNextStar) {
      loopMaxN = loopMaxN + v;
    }
    // 获取女精灵总数量
    int curGirlJinglingN = 80;
    // 获取当前最大的循环数,向下取整
    int floor = (curGirlJinglingN / loopMaxN).floor();
    int loopNum = jumpToNextStar.length;
    int showMaxNum = loopNum * (floor + 4);

    int tmpAddN = 0;

    int left = showMaxNum ~/ 2;

    ssLogggg(
      "=====loopMaxN:$loopMaxN curGirlJinglingN:$curGirlJinglingN floor:$floor showMaxNum:$showMaxNum",
    );

    for (int i = 0; i < showMaxNum; i++) {
      int quyu = i % loopNum;
      int star = jumpToNextStar[quyu];
      tmpAddN = tmpAddN + star;
      // 是否解锁
      bool hasUnlock = tmpAddN <= curGirlJinglingN;
      if (hasUnlock) {
        unlockMaxIndex = i;
      }
      int num = 25;
      String img = Assets.img.moneyGift.path;
      GiftRewardModel? tmpGiftRewardModel = kStarNum_vReward[star];
      if (tmpGiftRewardModel != null) {
        img = tmpGiftRewardModel.img;
        num = tmpGiftRewardModel.num;
      }
      double money = num * 1.0;
      BoxGiftModel boxGiftModel = BoxGiftModel(
        img: img,
        money: money,
        hasUnlock: hasUnlock,
      );
      Widget item = ItemWidget(model: boxGiftModel, index: i);
      bool hasEven = i.isEven;

      if (hasEven) {
        leftWidgetChildren.add(item);
      } else {
        rightWidgetChildren.add(item);
      }
    }
    ssLogggg("=====unlockMaxNum:$unlockMaxIndex left:$left");
    jumpIndex = unlockMaxIndex ~/ 2;
    for (int i = 0; i < left; i++) {
      bool hasLast = i == left - 1;
      Widget item = _lineItemWidget(index: i, hasLast: hasLast);
      lineWidgetChildren.add(item);
    }
  }

  scrollTo(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double offset = index * (_itemH + _bottomDistance);
      _controllers.animateTo(
        offset,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // bottomDistance = 60.h;
    // init();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow.withValues(alpha: 0),
      child: Stack(
        children: [
          linesWidget(),
          Row(
            children: [
              Expanded(child: leftWidget()),
              Expanded(child: rightWidget()),
            ],
          ),
        ],
      ),
    );
  }

  leftWidget() {
    return ListView(
      padding: EdgeInsets.zero,
      controller: _leftC,
      children: <Widget>[...leftWidgetChildren, commonWidget()],
    );
  }

  rightWidget() {
    return ListView(
      padding: EdgeInsets.zero,
      controller: _rightC,
      children: <Widget>[commonWidget(), ...rightWidgetChildren],
    );
  }

  linesWidget() {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          controller: _lineC,
          child: Column(children: [...lineWidgetChildren, commonWidget()]),
        ),
      ),
    );
  }

  commonWidget() {
    return SizedBox(height: 80.h);
  }

  _lineItemWidget({required int index, bool hasLast = false}) {
    int topIndex = 2 * index;
    int bottomIndex = 2 * index + 1;
    bool topLineUnlock = topIndex < unlockMaxIndex;
    bool bottomLineUnlock = bottomIndex < unlockMaxIndex;
    return Container(
      width: double.infinity,
      height: _itemH + _bottomDistance,

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 146.w,
            top: 38.h,
            child: Image.asset(
              topLineUnlock
                  ? Assets.img.giftUnlockRb.path
                  : Assets.img.giftLockRb.path,
              width: 124.h,
              height: 44.h,
            ),
          ),
          if (!hasLast)
            Positioned(
              right: 146.w,
              top: 120.h,
              child: Image.asset(
                bottomLineUnlock
                    ? Assets.img.giftUnlockLb.path
                    : Assets.img.giftLockLb.path,
                width: 124.h,
                height: 44.h,
              ),
            ),
        ],
      ),
    );
  }

  btnWidget({required bool hasUnlock}) {
    return GestureDetector(
      onTap: () {
        ssLogggg("==btnUnlock===");
      },
      child: Container(
        color: Colors.red.withValues(alpha: 0.0),
        width: 70.w,
        height: 25.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              hasUnlock
                  ? Assets.img.btnGiftUnlcok.path
                  : Assets.img.btnGiftLock.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            if (hasUnlock)
              Positioned(
                top: -8.h,
                right: -4.w,
                child: Image.asset(
                  Assets.img.video.path,
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 5.h,
              child: Center(
                child: SSTxtBorder(text: "Collect", fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double _bottomDistance = 50.h;
double _itemH = 112.h;
double _itemW = 100.w;

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.model, required this.index});

  final int index;
  final BoxGiftModel model;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  var box = SSHive.box;

  String keyIndexGift(int index) {
    return "asdfafdasdf$index";
  }

  String keyLastIndexClick() {
    return "sdfgdsfghgdfghdf";
  }

  bool sfIndexClick(int index) {
    bool open = false;
    var data = box.get(keyIndexGift(index)) ?? {};
    open = data['hasOpen'] ?? false;

    return open;
  }

  // bool hasFloatBox(int index) {
  //   bool open = false;
  //   var data = box.get(keyIndexGift(index)) ?? {};
  //   open = data['floatBox'] ?? false;
  //
  //   return open;
  // }

  setIndexJson({
    required int index,
    required bool hasClick,
    required double money,
    bool floatBox = false,
  }) {
    box.put(keyIndexGift(index), {
      "hasOpen": hasClick,
      "money": money,
      "floatBox": floatBox,
    });

    box.put(keyLastIndexClick(), index);
  }

  @override
  Widget build(BuildContext context) {
    bool hasUnlock = widget.model.hasUnlock;
    if (hasUnlock) {
      return _itemUnlockWidget(widget.model);
    }
    return _itemLockWidget(widget.model);
  }

  _itemUnlockWidget(BoxGiftModel model) {
    String centerImg = model.img;
    String money = "+${model.money.toStringAsFixed(0)}";
    return Container(
      color: Colors.yellow.withValues(alpha: 0.0),
      child: Center(
        child: Container(
          width: itemW,
          height: itemH,
          margin: EdgeInsets.only(bottom: bottomDistance),
          color: Colors.red.withValues(alpha: 0.0),
          child: Stack(
            children: [
              Image.asset(
                Assets.img.giftItemUmlock.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: 14.h),
                    Container(
                      width: 78.w,
                      height: 60.h,
                      // color: Colors.green,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.img.giftItemUnlockBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Center(
                            child: Image.asset(
                              centerImg,
                              width: 60.w,
                              height: 40.h,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 2.h,
                            child: Center(
                              child: SSTxtGraBorder(
                                text: money,
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
                                fontSize: 18.sp,
                                strokeColor: Color(0xff0C402B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    btnWidget(hasUnlock: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double itemH = _itemH;
  double itemW = _itemW;
  double bottomDistance = _bottomDistance;

  onClick() {

    bool hasUnlock = widget.model.hasUnlock;
    ssLogggg("==onClick==hasUnlock:$hasUnlock=");
    if(hasUnlock){
      bool hasClick11 = sfIndexClick(widget.index);
      if(hasClick11){
        ssLogggg("==onClick==hasUnlock:$hasUnlock=hasClick:$hasClick11");
        ssTushi(text: "you had collected");
        return;
      }

      setState(() {
        int index = widget.index;
        double money = 0;
        setIndexJson(index: index, hasClick: true, money: money);
      });
    }else{
      ssTushi(text: "Please collect star");
    }



  }

  btnWidget({required bool hasUnlock}) {

    bool hasClick = sfIndexClick(widget.index);
    if(hasUnlock){
      if(hasClick){
        hasUnlock = false;
      }
    }
    return GestureDetector(
      onTap: onClick,
      child: Container(
        color: Colors.red.withValues(alpha: 0.0),
        width: 70.w,
        height: 25.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              hasUnlock
                  ? Assets.img.btnGiftUnlcok.path
                  : Assets.img.btnGiftLock.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            if (hasUnlock)
              Positioned(
                top: -8.h,
                right: -4.w,
                child: Image.asset(
                  Assets.img.video.path,
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 5.h,
              child: Center(
                child: SSTxtBorder(text: "Collect", fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemLockWidget(BoxGiftModel model) {
    String centerImg = model.img;
    String money = "+${model.money.toStringAsFixed(0)}";
    return Container(
      color: Colors.yellow.withValues(alpha: 0.0),
      child: Center(
        child: Container(
          width: itemW,
          height: itemH,
          margin: EdgeInsets.only(bottom: bottomDistance),
          color: Colors.red.withValues(alpha: 0.0),
          child: Stack(
            children: [
              Image.asset(
                Assets.img.giftItemLock.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: 14.h),
                    Container(
                      width: 78.w,
                      height: 60.h,
                      // color: Colors.green,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              centerImg,
                              width: 60.w,
                              height: 40.h,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 2.h,
                            child: Center(
                              child: SSTxtGraBorder(
                                text: money,
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
                                fontSize: 18.sp,
                                strokeColor: Color(0xff0C402B),
                              ),
                            ),
                          ),
                          Image.asset(
                            Assets.img.giftItemLockBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),

                          Center(
                            child: Image.asset(
                              Assets.img.giftLock.path,
                              width: 29.w,
                              height: 36.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    btnWidget(hasUnlock: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxGiftModel {
  final String img;
  bool showAdImg;
  final double money;
  final bool hasUnlock;
  final bool hasClickCollect;

  BoxGiftModel({
    required this.img,
    this.showAdImg = true,
    this.hasClickCollect = true,
    required this.money,
    required this.hasUnlock,
  });
}
