import 'package:flutter/material.dart' hide Velocity;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/audio.dart';
import 'package:slots_132/jc_gj/jc_widget/animated_count.dart';
import 'package:slots_132/jc_gj/jc_widget/font_gradient_border.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_progress.dart';
import 'package:slots_132/ss_common/sssssp/spine_sdlr.dart';
import 'package:slots_132/ss_pages/maiiiiii/controller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/avatar_row.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/bottom_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/center_view.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/contetti.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/newton.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/slot_machine.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/cycle_roller.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/shimmer/shimmer_effect.dart';
import 'package:slots_132/ss_pages/maiiiiii/view/top_view.dart';
import 'package:slots_132/ss_pages/wheeee/whe_controller.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(MainController());
    Get.put(WheController());
    // bgMusic.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainView(),
    );
  }

  Widget mainView() {
    return SizedBox(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Stack(
        children: [
          Image.asset(
            Assets.img.mainBg.path,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child:SSContetti(),
          ),
          Column(
            children: [
              TopView(),
              AvatarRow(),
              Expanded(child: CenterView()),
              BottomView(),
            ],
          ),




        ],
      ),
    );
  }





}
