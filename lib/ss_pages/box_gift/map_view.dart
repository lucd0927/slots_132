import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_hive/sshive.dart';

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
  List<int> jumpToNextStar = [3, 6, 2, 8, 5, 1, 9, 4, 7, 10];
  var box = SSHive.box;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllers = LinkedScrollControllerGroup();
    _leftC = _controllers.addAndGet();
    _rightC = _controllers.addAndGet();
    _lineC = _controllers.addAndGet();

    for (int i = 0; i < 200; i++) {
      bool hasEven = i.isEven;
      bool showAdImg = false;
      double money = 100;
      bool hasLock = false;
      if (hasEven) {
        String img = Assets.img.moneyGift.path;

        BoxGiftModel boxGiftModel = BoxGiftModel(
          img,
          showAdImg,
          money,
          hasLock,
        );
        leftData.add(boxGiftModel);
      } else {
        String img = Assets.img.giftXpUnlock.path;
        BoxGiftModel boxGiftModel = BoxGiftModel(
          img,
          showAdImg,
          money,
          hasLock,
        );
        rightData.add(boxGiftModel);
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((_){
      _controllers.animateTo(200, curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    bottomDistance = 60.h;
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow.withValues(alpha: 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _lineC,
              child: Column(
                children: [
                  _lineWidgetRb(index: 0),
                  _lineWidgetRb(index: 1),
                  _lineWidgetRb(index: 2),
                  _lineWidgetRb(index: 3),
                  _lineWidgetRb(index: 4),
                  commonWidget(),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  controller: _leftC,
                  children: <Widget>[

                    _itemUnlockWidget(),
                    _itemUnlockWidget(),
                    _itemUnlockWidget(),
                    _itemUnlockWidget(),
                    _itemUnlockWidget(),
                    commonWidget(),

                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  controller: _rightC,
                  children: <Widget>[
                    commonWidget(),
                    _itemLockWidget(),
                    _itemLockWidget(),
                    _itemLockWidget(),
                    _itemLockWidget(),
                    _itemLockWidget(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  commonWidget(){
    return  SizedBox(height: 80.h);
  }

  double itemH = 112.h;
  double itemW = 100.w;

  _lineWidgetRb({required int index}) {
    bool hasEven = index.isEven;
    return Container(
      width: double.infinity,
      height: itemH + bottomDistance,

      // color: hasEven
      //     ? Colors.red.withValues(alpha: 0.8)
      //     : Colors.green.withValues(alpha: 0.8),
      child: Stack(
        children: [
          Positioned(
            left: 146.w,
            top: 38.h,
            child: Image.asset(
              Assets.img.giftLockRb.path,
              width: 124.h,
              height: 44.h,
            ),
          ),
          Positioned(
            right: 146.w,
            top: 130.h,
            child: Image.asset(
              Assets.img.giftLockLb.path,
              width: 124.h,
              height: 44.h,
            ),
          ),
        ],
      ),
    );
  }

  _lineWidgetLb() {
    return Container(
      margin: EdgeInsets.only(top: 60.h, right: 50.w),
      color: Colors.green.withValues(alpha: 0),
      child: Image.asset(
        Assets.img.giftLockLb.path,
        width: 124.h,
        height: 44.h,
      ),
    );
  }

  double bottomDistance = 50.h;

  _itemLockWidget() {
    return Container(
      color: Colors.yellow.withValues(alpha: 0.0),
      child: Center(
        child: Container(
          width: itemW,
          height: itemH,
          margin: EdgeInsets.only(bottom: bottomDistance),
          color: Colors.red.withValues(alpha: 0.2),
          child: Stack(
            children: [
              Image.asset(
                Assets.img.giftItemLock.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _itemUnlockWidget() {
    return Container(
      color: Colors.yellow.withValues(alpha: 0.0),
      child: Center(
        child: Container(
          width: itemW,
          height: itemH,
          margin: EdgeInsets.only(bottom: bottomDistance),
          color: Colors.red.withValues(alpha: 0.2),
          child: Stack(
            children: [
              Image.asset(
                Assets.img.giftItemUmlock.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
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
  final bool showAdImg;
  final double money;
  final bool hasLock;

  const BoxGiftModel(this.img, this.showAdImg, this.money, this.hasLock);
}
