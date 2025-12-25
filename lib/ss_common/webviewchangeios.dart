import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:slots_132/jc_gj/log.dart';

/// 接入示例代码Services
class WebviewChannelIos {
  WebviewChannelIos._internal();

  factory WebviewChannelIos() => _instance;

  static final WebviewChannelIos _instance = WebviewChannelIos._internal();

  static const MethodChannel _askfChhh = MethodChannel('com.slots.wvc143');

  /// 此处代码需在main文件中调用（只调用一次）
  Future<void> nbaIosChan(BuildContext context) async {
    ssLogggg("====rightAnsConfigIOSChannel=");
    _askfChhh.setMethodCallHandler((MethodCall call) async {
    });
  }
  /// 进入A面时就调用（只调用一次）
  Future<void> asdfAnsRAaaaVi1111() async {
    ssLogggg("==rightAnsRemoveView1====");
    _askfChhh.invokeMethod('ortejlkhdklh');
  }

  /// 进入B面时就调用（只调用一次）
  Future<void> asfdasfLoadCcccc() async {
    ssLogggg("==rightAnsLoadConfig====");
    _askfChhh.invokeMethod('rty12234rsgds');
  }

  /// 进入B面时就调用（只调用一次)
  Future<void> lasflkafAnsGetaldsjlkasfBbbb() async {
    ssLogggg("==rightAnsGetOffer====");
    _askfChhh.invokeMethod('sdfg456dgh22');
  }
  Future<void> idfaaaaaaa() async {
    String idfa = await FlutterTbaInfo().getIdfa();
    ssLogggg("==idfa====$idfa");
    _askfChhh.invokeMethod('dfgh9783srgdfh',idfa);
  }


  Future<void> distinctID() async {
    String idfa = await FlutterTbaInfo().getDistinctId();
    ssLogggg("==distinctID====$idfa");
    _askfChhh.invokeMethod('distinctID',idfa);
  }


  /// 点击项目右上角或其他地方打开web游戏调用（每次点击按钮调用）
  Future<void> alsdjklsfShowWvvvv() async {
    ssLogggg("==rightAnsShowWebview====");
    _askfChhh.invokeMethod('uyio12sadfrr');
  }
}