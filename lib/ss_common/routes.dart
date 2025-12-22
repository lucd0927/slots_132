

import 'package:get/get.dart';
import 'package:slots_132/ss_pages/daily_bonus/daily_bonus.dart';
import 'package:slots_132/ss_pages/maiiiiii/main.dart';
import 'package:slots_132/ss_pages/phone_card/phone_card.dart';
import 'package:slots_132/ss_pages/splasssss/kaiping.dart';
import 'package:slots_132/ss_pages/star_gift/star_gift.dart';
import 'package:slots_132/ss_pages/waye/waye.dart';
import 'package:slots_132/ss_pages/wheeee/wheeee.dart';
import 'package:slots_132/ss_pages/zhifu/chat/ai_chat.dart';
import 'package:slots_132/ss_pages/zhifu/history/history.dart';
import 'package:slots_132/ss_pages/zhifu/withddd_complete_paytaber.dart';
import 'package:slots_132/ss_pages/zhifu/withdrawwwww.dart';

class SSRouttttt {
  static const splash = "/asdfadfdsfg";
  static const main = "/shdfghgkjk";
  static const starGift = "/sdkfgkldsjl";
  static const test = "/tyukitkghlk";

  static const wheeee = "/aishdoiudfgio";

  static const withdrawwwww = "/Withdrawwwww";
  static const historyyyy = "/Historyyyy";
  static const aichat = "/aichat";
  static const phoneCardPage = "/PhoneCardPage";
  static const dailyBonus = "/adfgdsfgsdfg";
  static const withdddCompletePaytaber = "/WithdddCompletePaytaber";
  static const wayeeee = "/SSWaye";

  static List<GetPage> pages = [
      GetPage(name: splash, page: () =>  SSSplassss()),
      GetPage(name: main, page: () =>  Main()),
      GetPage(name: starGift, page: () =>  StarGift(),transition: Transition.cupertinoDialog),
      GetPage(name: wheeee, page: () =>  Wheeee(),transition: Transition.cupertinoDialog),
      GetPage(name: withdrawwwww, page: () =>  Withdrawwwww(),transition: Transition.cupertinoDialog),
      GetPage(name: historyyyy, page: () =>  Historyyyy(),transition: Transition.cupertinoDialog),
      GetPage(name: aichat, page: () =>  AiChat(),transition: Transition.cupertinoDialog),
      GetPage(name: phoneCardPage, page: () =>  PhoneCardPage(),transition: Transition.cupertinoDialog),
      GetPage(name: withdddCompletePaytaber, page: () =>  WithdddCompletePaytaber(),transition: Transition.cupertinoDialog),
      GetPage(name: wayeeee, page: () =>  SSWaye(),transition: Transition.cupertinoDialog),
      GetPage(name: dailyBonus, page: () =>  DailyBonus(onClose: (){}),transition: Transition.noTransition),
  ];
}
