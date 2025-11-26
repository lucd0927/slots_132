import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:spine_flutter/spine_flutter.dart';

class SSSpineBigwin extends StatefulWidget {
  const SSSpineBigwin({super.key});

  @override
  State<SSSpineBigwin> createState() => _SSSpineBigwinState();
}

class _SSSpineBigwinState extends State<SSSpineBigwin> {
  bool showA = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showA = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = MainController.composition(EnumLottieType.bigwin);
    if(data != null){
      return Lottie(composition: data,);
    }
    return Lottie.asset(Assets.lottt.bigwin.data, repeat: true,frameBuilder: (_, child, __) => child,);
    if (!showA) {
      return const SizedBox();
    }

    reportLeaks();
    final controller = SpineWidgetController(
      onInitialized: (controller) {
        // Set the default mixing time between animations

        controller.animationState.data.defaultMix = 0.2;
        // Set the portal animation on track 0
        controller.animationState.setAnimation(0, "animation", true);
        // Queue the run animation after the portal animation
        // controller.animationState.addAnimationByName(0, "run", true, 0);
      },
    );

    return SpineWidget.fromAsset(
      Assets.donghua.bigwin.jiesuan02Atlas,
      Assets.donghua.bigwin.skeleton,
      controller,
      sizedByBounds: true,
    );
  }
}

//
// class SpineShengdaolaoren extends StatelessWidget {
//   const SpineShengdaolaoren({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     reportLeaks();
//     final controller = SpineWidgetController(onInitialized: (controller) {
//       // Set the default mixing time between animations
//       controller.animationState.getData().setDefaultMix(0.2);
//       // Set the portal animation on track 0
//       controller.animationState.setAnimationByName(0, "animation", true);
//       // Queue the run animation after the portal animation
//       // controller.animationState.addAnimationByName(0, "run", true, 0);
//     });
//
//     return SpineWidget.fromAsset(Assets.donghua.sdlr.sdlrAtlas, Assets.donghua.sdlr.skeleton, controller,sizedByBounds: true,);
//   }
// }
