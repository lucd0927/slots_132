// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.324524
import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:slots_132/jc_hive/sshive.dart';

import 'log.dart';

class SSDlTracking {
  static const String _lastLoginKey = 'asddfg';
  // 检查当天登录
  static const String _isTodayLogin = 'yteehtshd';

  // 启动了多少天
  static const String _launchDay = 'ewqrqwwqer';

  // 启动了多少次
  static const String _launchCount = 'agsdherfdahhdfh';

  static Box get box => SSHive.box;

  static void init() {
    _jianchaDenglu();
    _jisuanqidongCishu();
    _jisuanqidongduoshaoDay();
    checkLoginStreak();
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
    ssLogggg(
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
      ssLogggg("===todayLoggg:$todayLoggg=");
    }

    ssLogggg(
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

  static int _jisuanqidongduoshaoDay() {
    bool firstLogin = isFirstLoginToday;
    int day = box.get(_launchDay) ?? 0;
    if (firstLogin) {
      day = day + 1;
    }

    ssLogggg("======launchDay:$day isFirstLoginToday:$isFirstLoginToday");
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
    ssLogggg("initLaunchCount:$count ");
    return count;
  }

  // 启动了多少次
  static int qiduoCishu() {
    int count = box.get(_launchCount) ?? 1;
    ssLogggg("======GGLoginTracker===launchCount:$count");
    return count;
  }

  /// 检查是否是当天第一次登录（基于 UTC 时间）
  static bool get isFirstLoginToday => _isFirstLoginTodayasdfas;

  static bool _isFirstLoginTodayasdfas = false;

  static const int _maxStreak = 7; // 连续7天后重置
  // 连续登录天数
  static const String hLianxuLoginDay = "akjshfdkjahfs";
  //  连续登录时间
  static const String hLianxuLoginTime = "zbcjvhjysdf";
  /// 检查是否连续登录，并更新计数
  static checkLoginStreak()  {

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final lastMillis = box.get(hLianxuLoginTime);
    final lastDate = lastMillis != null
        ? DateTime.fromMillisecondsSinceEpoch(lastMillis)
        : null;

    int streak = box.get(hLianxuLoginDay) ?? 0;

    if (lastDate == null) {
      // 首次登录
      streak = 1;
    } else {
      final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
      final diff = today.difference(lastDay).inDays;

      if (diff == 1) {
        streak += 1; // 连续登录 +1
        if (streak > _maxStreak) {
          streak = 1; // 达到7天后重置
        }
      } else if (diff > 1) {
        streak = 1; // 中断重置
      } else {
        // diff == 0 => 今天已登录，不变
      }
    }

    // 存储数据
    box.put(hLianxuLoginDay, streak);
    box.put(hLianxuLoginTime, today.millisecondsSinceEpoch);

    return streak;
  }

  static int lianxuLoginDay(){
    return box.get(hLianxuLoginDay) ?? 1;
  }

}    
