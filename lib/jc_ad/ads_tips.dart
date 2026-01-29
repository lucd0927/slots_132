import 'dart:ui';

import 'package:get/get.dart';
import 'package:slots_132/jc_ad/kuangkuang/ad_failed.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';


class SSAdsTtt {
  static void toast({
    String? text,
  }) {
    ssTushi(text: text??"loading_failed2".tr);
  }

  static noAds({
    required VoidCallback onTryAgain,
    required VoidCallback onClose,
  }) async {
    bool isShowing = false;
    showAdFailedDialog(
      Get.context!,
      onBtn: () {
        if(!isShowing){
          isShowing = true;
          onTryAgain();
        }

      },
      onClose: () {
        if(!isShowing){
          isShowing = true;
          onClose();
        }

      },
    );
  }
}
