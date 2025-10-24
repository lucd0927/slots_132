import 'package:flutter/services.dart';

//TODO:修改所有的函数名
final class Pbpig {
  static final Pbpig instance = Pbpig._internal();

  Pbpig._internal();

  final _methodChannel = const MethodChannel('pbpig');

  //设备是否被Root
  Future<bool> rttttt() async {
    return (await _methodChannel.invokeMethod("rttttt")) == true;
  }

  //是否连接VPN网络
  Future<bool> vpppppn() async {
    return (await _methodChannel.invokeMethod("vpppppn")) == true;
  }

  //设备是否有可用的sim卡
  Future<bool> sicccccm() async {
    return (await _methodChannel.invokeMethod("sicccccm")) == true;
  }

  //设备是否为模拟器
  Future<bool> sicccccmulator() async {
    return (await _methodChannel.invokeMethod("sicccccmulator")) == true;
  }

  //应用是否安装自Google play store
  Future<bool> stoooxxxre() async {
    return (await _methodChannel.invokeMethod("stoooxxxre")) == true;
  }

  //设备是否启用开发者模式
  Future<bool> dessssvewwwloffffper() async {
    return (await _methodChannel.invokeMethod("dessssvewwwloffffper")) == true;
  }

  //安装应用的安装器程序的包名
  Future<String> installer() async {
    return await _methodChannel.invokeMethod("installer");
  }

  //初始化数盟平台
  Future<void> initddddNumsssberUdddnit({required String apiKey}) async {
    await _methodChannel.invokeMethod("initddddNumsssberUdddnit", apiKey);
  }

  //从数盟平台读取数盟可信ID，对应文档请求参数：did
  Future<String> getNaaaaufffbedddrUnitID({
    String channel = "",
    String message = "",
  }) async {
    return (await _methodChannel.invokeMethod("getNaaaaufffbedddrUnitID", {
      "channel": channel,
      "message": message,
    })) ??
        "";
  }
}