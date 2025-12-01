import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:spine_flutter/spine_flutter.dart';

class SSSpineWheelMoney extends StatefulWidget {
  const SSSpineWheelMoney({super.key});

  @override
  State<SSSpineWheelMoney> createState() => _SSSpineWheelMoneyState();
}

class _SSSpineWheelMoneyState extends State<SSSpineWheelMoney> {
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
    var data = MainController.composition(EnumLottieType.wheelmoney);
    if(data != null){
      return Lottie(composition: data,);
    }
    return Lottie.asset(Assets.lottt.zhuanpanbj.data, repeat: true,frameBuilder: (_, child, __) => child,);

  }
}

