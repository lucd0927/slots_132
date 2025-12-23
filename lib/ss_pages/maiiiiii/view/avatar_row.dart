import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_confetti/flutter_confetti.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_ad/guiyin/package.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:slots_132/ss_common/animated_win/animated_jackpot_mini.dart';
import 'package:slots_132/ss_common/animated_win/animated_win_big.dart';
import 'package:slots_132/ss_common/animated_win/animated_win_mega.dart';
import 'package:slots_132/ss_common/animated_win/animated_win_super.dart';
import 'package:slots_132/ss_common/animated_win/animated_win_wow.dart';
import 'package:slots_132/ss_common/sssssp/spine_main_avatar.dart';
import 'package:slots_132/ss_common/sssssp/spine_tanc_xuanguang.dart';

class AvatarRow extends StatefulWidget {
  const AvatarRow({super.key});

  @override
  State<AvatarRow> createState() => _AvatarRowState();
}

class _AvatarRowState extends State<AvatarRow> {
  // List<AvatarModel> avatarDatas = [];
  List<AvatarModel> datas = [];
  int avatarLength = 12;
  BuildContext? childContext;
  int selectIndex = -1;
  int winSelect = -1;

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
    for (int i = 0; i < 5; i++) {
      // ConfettiController controller = ConfettiController();
      // controllers.add(controller);
    }
    initTimer();
  }

  initTimer() {
    List<int> times = [5000, 7000, 9000, 11000, 13000];
    int time = times[Random().nextInt(times.length)];
    // ssLogggg("=====avatarRow time:$time");
    timer?.cancel();
    timer = Timer(Duration(milliseconds: time), () {
      if (mounted) {
        setState(() {
          int randomIndex = Random().nextInt(4) + 1;
          int randomIndex2 = Random().nextInt(5);
          // randomIndex2 =1;
          selectIndex = randomIndex;
          winSelect = randomIndex2;
          ssLogggg("=====selectIndex:$selectIndex childContext:$childContext");
          Future.delayed(Duration(milliseconds: 3000), () {
            if (mounted) {
              setState(() {
                selectIndex = -1;
                winSelect = -1;
              });
            }
            initTimer();
          });
        });
      }
    });
  }

  String randomName({int maxLength = 10}) {
    const letters = 'abcdefghijklmnopqrstuvwxyz';
    final random = Random();

    // 随机长度（1 到 maxLength 之间）
    final length = maxLength;

    // 生成随机字符串
    final name = List.generate(length, (_) {
      return letters[random.nextInt(letters.length)];
    }).join();

    return name;
  }

  List<String> names = [
    "Sarah J",
    "Michael B",
    "David T",
    "Jessica M",
    "Robert K",
    "Jennifer L",
    "William H",
    "Elizabeth D",
    "James P",
    "Linda S",
    "Richard G",
    "Patricia A",
    "Thomas C",
    "Barbara W",
    "Christopher R",
  ];

  initData() {
    names.shuffle();
    for (int i = 1; i < 13; i++) {
      int aIndex = i % avatarLength + 1;
      // ssLogggg("=====aIndex:$aIndex");
      String avatar = "assets/img/avatar/avatar$aIndex.png";
      // int maxLength = Random().nextInt(8) + 2;
      String name = names[i];
      AvatarModel data = AvatarModel(img: avatar, name: name);
      datas.add(data);
    }
    int maxLength = Random().nextInt(8) + 2;
    String name = "You";
    String avatar = Assets.img.avatar.avatarD.path;
    AvatarModel data = AvatarModel(img: avatar, name: name);
    datas.shuffle();
    datas.insert(0, data);
  }

  @override
  Widget build(BuildContext context) {
    return avatarWidget();
  }

  avatarWidget() {
    List<Widget> items = [];
    int lenght = datas.length;

    for (int i = 0; i < lenght; i++) {
      AvatarModel data = datas[i];
      Widget item = avatarItem(data: data, index: i, hasFirst: i == 0);
      items.add(item);
    }
    return Container(
      width: double.infinity,
      height: 56.h,
      margin: EdgeInsets.only(top: 4.h),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ),
    );
  }

  avatarItem({
    required AvatarModel data,
    bool hasFirst = false,
    required int index,
  }) {
    double height = 48.h;
    double width = 40.h;
    if (hasFirst) {
      height = 62.h;
      width = 52.w;
    }
    String name = data.name;
    String img = data.img;
    return Container(
      width: width,
      height: height,
      // color: Colors.red,
      margin: EdgeInsets.only(right: 20.w),
      child: Builder(
        builder: (context) {
          if (selectIndex == index) {
            childContext = context;
          }
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    img,
                    width: width,
                    height: width,
                    gaplessPlayback: true,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    Assets.img.avatarBg.path,
                    width: width,
                    height: width,
                    gaplessPlayback: true,
                  ),
                ),
              ),

              Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: width,
                  height: width * 13 / 43,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.img.avatarBottom.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
                        ),
                      ),
                      Positioned.fill(
                        left: 2.w,
                        right: 2.w,
                        child: Container(
                          // color: Colors.blueAccent,
                          child: Center(
                            child: Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                // fontFamily: FontFamily.rubik,
                                fontSize: 7.sp,
                                color: Color(0xffffffff),
                                height: 1,

                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (index == selectIndex )
                Positioned(
                  left: SSABChange.isPackageB() ? -20.w : 0,
                  right: SSABChange.isPackageB() ? -20.w : 0,
                  top:SSABChange.isPackageB() ?  -10.h:0,
                  bottom: SSABChange.isPackageB() ? 0:0.h,
                  child: Container(
                    child: Center(
                      child: SSABChange.isPackageB()
                          ? const SpineMainAvatar()
                          : FittedBox(child: const SpineTancXuanguang(),),
                    ),
                  ),
                ),
              // SpineTancXuanguang(),
              if (index == selectIndex)
                Positioned(
                  left: 8.w,
                  right: 8.w,
                  top: -10.h,
                  bottom: -10.h,
                  child: Center(
                    child: Container(
                      width: 30.w,
                      height: double.infinity,
                      // color: Colors.white,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: winSelect == 0
                            ? SSAnimatedWinSuper()
                            : winSelect == 1
                            ? SSAnimatedWinMega()
                            : winSelect == 2
                            ? SSAnimatedWinBig()
                            : winSelect == 3
                            ? SSAnimatedWinWow()
                            : SSAnimatedJackpotMini(),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AvatarModel {
  final String img;
  final String name;

  const AvatarModel({required this.img, required this.name});
}
