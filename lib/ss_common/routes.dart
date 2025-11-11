

import 'package:get/get.dart';
import 'package:slots_132/ss_pages/box_gift/box_gift.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/splasssss/kaiping.dart';
import 'package:slots_132/ss_pages/wheeee/wheeee.dart';
import 'package:slots_132/ss_pages/zhifu/chat/ai_chat.dart';
import 'package:slots_132/ss_pages/zhifu/history/history.dart';
import 'package:slots_132/ss_pages/zhifu/withdrawwwww.dart';

class SSRouttttt {
  static const splash = "/asdfadfdsfg";
  static const main = "/shdfghgkjk";
  static const boxGift = "/sdkfgkldsjl";
  static const test = "/tyukitkghlk";

  static const wheeee = "/aishdoiudfgio";

  static const withdrawwwww = "/Withdrawwwww";
  static const historyyyy = "/Historyyyy";
  static const aichat = "/aichat";

  static List<GetPage> pages = [
      GetPage(name: splash, page: () =>  SSSplassss()),
      GetPage(name: main, page: () =>  Main()),
      GetPage(name: boxGift, page: () =>  BoxGift(),transition: Transition.cupertinoDialog),
      GetPage(name: wheeee, page: () =>  Wheeee(),transition: Transition.cupertinoDialog),
      GetPage(name: withdrawwwww, page: () =>  Withdrawwwww(),transition: Transition.cupertinoDialog),
      GetPage(name: historyyyy, page: () =>  Historyyyy(),transition: Transition.cupertinoDialog),
      GetPage(name: aichat, page: () =>  AiChat(),transition: Transition.cupertinoDialog),
  ];
}
