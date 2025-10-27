import 'dart:ui';

import 'package:get/get.dart';
import 'package:slots_132/jc_ad/kuangkuang/ad_failed.dart';
import 'package:slots_132/jc_gj/jc_widget/pb_tushi.dart';


class SSAdsTtt {
  static void toast({
    String text = "Ad loading failed, please try again later",
  }) {
    ssTushi(text: text);
  }

  static noAds({
    required VoidCallback onTryAgain,
    required VoidCallback onClose,
  }) async {
    showAdFailedDialog(
      Get.context!,
      onBtn: () {
        onTryAgain();
      },
      onClose: () {
        onClose();
      },
    );
  }
}
