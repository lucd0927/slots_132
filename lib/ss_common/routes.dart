

import 'package:get/get.dart';
import 'package:slots_132/ss_pages/box_gift/box_gift.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/splasssss/kaiping.dart';
import 'package:slots_132/ss_pages/wheeee/wheeee.dart';

class SSRouttttt {
  static const splash = "/asdfadfdsfg";
  static const main = "/shdfghgkjk";
  static const boxGift = "/sdkfgkldsjl";
  static const test = "/tyukitkghlk";

  static const wheeee = "/aishdoiudfgio";
  static const wheeeeOld = "/lkjskfgklkjjkl";

  // static const quiz_cash = "/quiz_cash";

  static List<GetPage> pages = [
      GetPage(name: splash, page: () =>  SSSplassss()),
      GetPage(name: main, page: () =>  Main()),
      GetPage(name: boxGift, page: () =>  BoxGift(),transition: Transition.zoom),
      GetPage(name: wheeee, page: () =>  Wheeee(),transition: Transition.zoom),
      // GetPage(name: wheeeeOld, page: () =>  WheeeeOld(),transition: Transition.size),
  ];
}
