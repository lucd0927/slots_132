import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:spine_flutter/spine_flutter.dart';

class SpineMainAvatar extends StatefulWidget {
  const SpineMainAvatar({super.key});

  @override
  State<SpineMainAvatar> createState() => _SpineMainAvatarState();
}

class _SpineMainAvatarState extends State<SpineMainAvatar> {
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
    if (!showA) {
      return const SizedBox();
    }

    return Lottie.asset(Assets.lottt.avatar.data, repeat: true,frameBuilder: (_, child, __) => child,);

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
      Assets.donghua.avatar.jinbiAtlas,
      Assets.donghua.avatar.e8,
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
