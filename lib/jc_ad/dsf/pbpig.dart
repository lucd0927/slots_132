import 'package:flutter/services.dart';
import 'package:pbpig/pbpig.dart';

//TODO:修改所有的函数名
final class SSFengKkkk {
  static final SSFengKkkk instance = SSFengKkkk._internal();

  SSFengKkkk._internal();

  final _methodChannel = SanfangFk.instance.methodChannel;

  //设备是否被Root
  Future<bool> rttttt() async {
    return SanfangFk.instance.rttttt();
  }

  //是否连接VPN网络
  Future<bool> vpppppn() async {
    return SanfangFk.instance.vpppppn();
  }

  //设备是否有可用的sim卡
  Future<bool> sicccccm() async {
    return SanfangFk.instance.sicccccm();
  }

  //设备是否为模拟器
  Future<bool> sicccccmulator() async {
    return SanfangFk.instance.sicccccmulator();
  }

  //应用是否安装自Google play store
  Future<bool> stoooxxxre() async {
    return SanfangFk.instance.stoooxxxre();
  }

  //设备是否启用开发者模式
  Future<bool> dessssvewwwloffffper() async {
    return SanfangFk.instance.dessssvewwwloffffper();
  }

  //安装应用的安装器程序的包名
  Future<String> installer() async {
    return SanfangFk.instance.installer();
  }

  //初始化数盟平台
  Future<void> initddddNumsssberUdddnit({required String apiKey}) async {
    await SanfangFk.instance.initddddNumsssberUdddnit(apiKey: apiKey);
  }

  //从数盟平台读取数盟可信ID，对应文档请求参数：did
  Future<String> getNaaaaufffbedddrUnitID({
    String channel = "",
    String message = "",
  }) async {
    return SanfangFk.instance.getNaaaaufffbedddrUnitID() ??
        "";
  }
}