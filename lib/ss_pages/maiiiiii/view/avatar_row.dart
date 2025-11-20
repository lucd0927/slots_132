import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';

class AvatarRow extends StatefulWidget {
  const AvatarRow({super.key});

  @override
  State<AvatarRow> createState() => _AvatarRowState();
}

class _AvatarRowState extends State<AvatarRow> {
  // List<AvatarModel> avatarDatas = [];
  List<Widget> children = [];
  int avatarLength = 6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
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

  initData() {
    for (int i = 1; i < 50; i++) {
      int aIndex = i % avatarLength + 1;
      // ssLogggg("=====aIndex:$aIndex");
      String avatar = "assets/img/avatar/avatar$aIndex.png";
      int maxLength = Random().nextInt(8) + 2;
      String name = randomName(maxLength: maxLength);
      AvatarModel data = AvatarModel(img: avatar, name: name);
      // avatarDatas.add(data);
      Widget item = avatarItem(data: data);
      children.add(item);
    }
    int maxLength = Random().nextInt(8) + 2;
    String name = "You";
    String avatar = Assets.img.avatar.avatarD.path;
    AvatarModel data = AvatarModel(img: avatar, name: name);
    Widget item = avatarItem(data: data, hasFirst: true);
    children.shuffle();
    children.insert(0, item);
  }

  @override
  Widget build(BuildContext context) {
    return avatarWidget();
  }

  avatarWidget() {
    return Container(
      width: double.infinity,
      height: 60.h,
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  avatarItem({required AvatarModel data, bool hasFirst = false}) {
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
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Center(
              child: Image.asset(img, width: width, height: width,gaplessPlayback: true,),
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
                            fontFamily: FontFamily.rubik,
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
        ],
      ),
    );
  }
}

class AvatarModel {
  final String img;
  final String name;

  const AvatarModel({required this.img, required this.name});
}
