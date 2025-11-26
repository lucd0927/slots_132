import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:spine_flutter/spine_flutter.dart';

import '../../gen/assets.gen.dart';

class SSSpineMoney extends StatefulWidget {
  const SSSpineMoney({super.key});

  @override
  State<SSSpineMoney> createState() => _SSSpineMoneyState();
}

class _SSSpineMoneyState extends State<SSSpineMoney> {
  bool showA = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (mounted) {
    //     setState(() {
    //       showA = true;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var data = MainController.composition(EnumLottieType.money);
    if(data != null){
      return Lottie(composition: data,);
    }
    return Lottie.asset(Assets.donghua.lottieMoney.data, repeat: true,frameBuilder: (_, child, __) => child,);
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
      Assets.donghua.money.skeletonAtlas,
      Assets.donghua.money.skeletonJson,
      controller,
      fit: BoxFit.contain,
      // sizedByBounds: true,
    );
  }
}
