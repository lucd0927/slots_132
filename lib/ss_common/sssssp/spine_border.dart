import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/ss_pages/maiiiiii/main_controller.dart';
import 'package:spine_flutter/spine_flutter.dart';

class SSSpineBorder extends StatefulWidget {
  const SSSpineBorder({super.key});

  @override
  State<SSSpineBorder> createState() => _SSSpineBorderState();
}

class _SSSpineBorderState extends State<SSSpineBorder> {
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
    var data = MainController.composition(EnumLottieType.bian);
    if(data != null){
      return Lottie(composition: data,);
    }
    return Lottie.asset(Assets.lottt.bian.data, repeat: true,frameBuilder: (_, child, __) => child,);

  }
}

