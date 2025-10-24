// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.324524
import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../hive/sshive.dart';
import 'log.dart';

class PBLoginGenzhong {
  static const String _lastLoginKey = 'last_login_utc_date';
  // 检查当天登录
  static const String _isTodayLogin = 'slkjfldsjlfgj';

  // 启动了多少天
  static const String _launchDay = 'hive_launchDay';

  // 启动了多少次
  static const String _launchCount = 'hive_launchCount';

  static Box get box => PBHive.box;

  static void init() {
    _jianchaDenglu();
    _jisuanqidongCishu();
    jisuanqidongduoshaoDay();
  }

  /// 检查是否是当天第一次登录（基于 UTC 时间）
  static bool _jianchaDenglu() {
    final nowUtc = DateTime.now().toUtc();

    final todayUtcString = _zhuanhuashijian(nowUtc);

    final lastLoginDate = box.get(_lastLoginKey) ?? "";
    bool firstLogin = false;
    if (lastLoginDate != todayUtcString) {
      // 保存新的登录日期（UTC 格式）
      box.put(_lastLoginKey, todayUtcString);
      firstLogin = true;
    }
    _isFirstLoginTodayasdfas = firstLogin;
    pbLog(
      "todayUtcString:$todayUtcString lastLoginDate:$lastLoginDate isFirstLoginToday:$firstLogin",
    );
// auto patch 415
    return firstLogin;
  }

  static bool isTodayLogin() {
    final nowUtc = DateTime.now().toUtc();
    final todayUtcString = _zhuanhuashijian(nowUtc);
    String lastLoginDate = box.get(_isTodayLogin) ?? "";
    if(lastLoginDate.isEmpty){
      box.put(_isTodayLogin, todayUtcString);
      return true;
    }


    bool todayLoggg = true;
    if (lastLoginDate != todayUtcString) {
      // 保存新的登录日期（UTC 格式）
      box.put(_isTodayLogin, todayUtcString);
      todayLoggg = false;
      pbLog("===todayLoggg:$todayLoggg=");
    }

    pbLog(
      "todayUtcString:$todayUtcString lastLoginDate:$lastLoginDate isTodayLogin:$todayLoggg",
    );
// auto patch 415
    return todayLoggg;
  }




  // 启动了多少天
  static int qidongduoshaoDay() {
    int day = box.get(_launchDay) ?? 1;

    // ggPrint("======launchDay:$day isFirstLoginToday:$isFirstLoginToday");
    return day;
  }

  static int jisuanqidongduoshaoDay() {
    bool firstLogin = isFirstLoginToday;
    int day = box.get(_launchDay) ?? 0;
    if (firstLogin) {
      day = day + 1;
    }

    pbLog("======launchDay:$day isFirstLoginToday:$isFirstLoginToday");
    box.put(_launchDay, day);
    return day;
  }

  /// 将日期格式化为 yyyy-MM-dd
  static String _zhuanhuashijian(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
  // 初始化启动次数
  static int _jisuanqidongCishu() {
    int count = box.get(_launchCount) ?? 0;

    count = count + 1;
    box.put(_launchCount, count);
    pbLog("initLaunchCount:$count ");
    return count;
  }

  // 启动了多少次
  static int qiduoCishu() {
    int count = box.get(_launchCount) ?? 1;
    pbLog("======GGLoginTracker===launchCount:$count");
    return count;
  }

  /// 检查是否是当天第一次登录（基于 UTC 时间）
  static bool get isFirstLoginToday => _isFirstLoginTodayasdfas;

  static bool _isFirstLoginTodayasdfas = false;




}    
