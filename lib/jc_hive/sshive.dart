


import 'package:hive_ce_flutter/hive_flutter.dart';

class SSHive {
  static const String hkBbbb = "sdfdsgk1lj132";
  static const String hkBoxChat = "dsfg1sdffgdsfgdsfg";
  static const String hkHistory = "posdfklewlijl3kasdnklx";

  static Box get box => Hive.box(SSHive.hkBbbb);
  static Box get boxChat => Hive.box(SSHive.hkBoxChat);
  static Box get boxHistory => Hive.box(SSHive.hkHistory);
}
