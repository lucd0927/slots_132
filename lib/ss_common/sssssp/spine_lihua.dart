
import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

import '../../gen/assets.gen.dart';


class SSSpineYanhua extends StatefulWidget {
  const SSSpineYanhua({super.key});

  @override
  State<SSSpineYanhua> createState() => _SSSpineYanhuaState();
}

class _SSSpineYanhuaState extends State<SSSpineYanhua> {

  bool showA = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(mounted){
        setState(() {
          showA = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!showA) {
      return const SizedBox();
    }

    reportLeaks();
    final controller = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.data.defaultMix = 0.2;
      // Set the portal animation on track 0
      controller.animationState.setAnimation(0, "show3", true);
      // Queue the run animation after the portal animation
      // controller.animationState.addAnimationByName(0, "run", true, 0);
    });

    return SpineWidget.fromAsset(Assets.donghua.yanhua.flyPokerAtlas, Assets.donghua.yanhua.flyPokerJson, controller);
  }
}



