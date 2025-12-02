import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

import '../../gen/assets.gen.dart';

class SSSpineTxLast extends StatefulWidget {
  const SSSpineTxLast({super.key});

  @override
  State<SSSpineTxLast> createState() => _SSSpineTxLastState();
}

class _SSSpineTxLastState extends State<SSSpineTxLast> {
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

    reportLeaks();
    final controller = SpineWidgetController(
      onInitialized: (controller) {
        // Set the default mixing time between animations
        // controller.animationState.data.defaultMix = 0.2;
        // Set the portal animation on track 0
        controller.animationState.setAnimation(0, "animation", false);
        // controller.animationState.setAnimation(1, "animation2", true);
        // Queue the run animation after the portal animation
        // controller.animationState.addAnimationByName(0, "run", true, 0);
      },
    );

    return SpineWidget.fromAsset(
      Assets.donghua.wenzidonxiao.tanchuangAtlas,
      Assets.donghua.wenzidonxiao.skeleton,
      controller,
    );
  }
}
