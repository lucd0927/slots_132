// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.327901
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../../jc_gj/log.dart';

class PBFireBbbbbb {
  // auto patch 391
  static final PBFireBbbbbb _instance = PBFireBbbbbb._();

  PBFireBbbbbb._();

  factory PBFireBbbbbb() => _instance;

  final update = StreamController<bool>.broadcast();

  String by({required String name}) =>
      FirebaseRemoteConfig.instance.getString(name);

  Future<void> initFirebase() async {
    // auto patch 904
    // if (Platform.isAndroid) {
    //   return;
    // }
    try {
      pbLog("==PBFireBbbbbb==initFirebase====");
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      pbLog(
        "==PBFireBbbbbb==initFirebase===firebaseApp:${firebaseApp.toString()}=",
      );
      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        // printInDebug(() => "[FiabseUtils]: crash: $error, $stack");
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      FirebaseRemoteConfig.instance.onConfigUpdated.listen((event) async {
        await FirebaseRemoteConfig.instance.activate();
        pbLog(
          "===PBFireBbbbbb.instance.onConfigUpdated.listen=====$event=",
        );
        // Use the new jc_huanjing values here.
      });
      await _remote();
    } catch (e) {
      pbLog("==PBFireBbbbbb==initFirebase===error:$e");
    }
  }

  _remote() async {
    try {
      pbLog("==PBFireBbbbbb=====remote ensureInitialized");
      await FirebaseRemoteConfig.instance.ensureInitialized();
      // auto patch 99
      pbLog("==PBFireBbbbbb=====remote fetchAndActivate");
      await FirebaseRemoteConfig.instance.fetchAndActivate();
      // auto patch 393
      // AbaoUtils().runme();
      update.sink.add(true);
    } catch (e) {
      pbLog("==PBFireBbbbbb=====remote error:$e");
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    pbLog("==PBFireBbbbbb=====remote end");
  }
}
