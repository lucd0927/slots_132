


import 'package:hive_ce_flutter/hive_flutter.dart';

class SSHive {
  static const String hkBbbb = "sdfdsgklj132";
  static const String hkBoxChat = "dsfgsdffgdsfgdsfg";
  static const String hkHistory = "posdfklewlijlkasdnklx";

  static Box get box => Hive.box(SSHive.hkBbbb);
  static Box get boxChat => Hive.box(SSHive.hkBoxChat);
  static Box get boxHistory => Hive.box(SSHive.hkHistory);
}
