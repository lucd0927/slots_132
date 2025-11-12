import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_gj/restore_bottom_bar.dart';
import 'package:slots_132/jc_hive/sshive.dart';

enum EnumSSPaymentMethod {
  paypal('paypal'),
  cashApp('cashApp'),
  bank('bankTransfer');

  final String name;

  const EnumSSPaymentMethod(this.name);
}

class WithdddController extends GetxController {
  static WithdddController get to => Get.find();
  static const String hkAvatar = 'avatar_path';
  static const String hkVipClick = 'sdfglksdjklsdeqrrfsdg';
  static const String hkVipTime = 'orutgmqqqasdfasfd';
  static const int vipPartnerTime = 60 * 60 * 24;

  // static const int vipPartnerTime = 6;
  void onClickVipGetChange() {
    box.put(hkVipClick, true);
  }

  bool hasClickVipGet() {
    return box.get(hkVipClick, defaultValue: false);
  }

  var box = SSHive.box;

  // 新增：头像文件与 ImagePicker 实例
  File? _avatarFile;
  final ImagePicker _picker = ImagePicker();

  // 新增：从相册选择头像
  Future<void> pickAvatar() async {
    ssLogggg("==_pickAvatar==");
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        imageQuality: 85,
      );
      if (picked == null) return;
      _avatarFile = File(picked.path);
      box.put(hkAvatar, picked.path);
    } catch (e) {
      // 简单处理，可换成 SnackBar 或日志
      ssLogggg('pick avatar error: $e');
    }

    SystemUiHelper.restoreTransparentNavBar();
    update();
  }

  File? get avatarFile => _avatarFile;

  initAvatar() {
    String? path = box.get(hkAvatar);
    if (path != null) {
      _avatarFile = File(path);
    }
  }

  var selectedPaymentBank = (EnumSSPaymentMethod.paypal.name).obs;

  String currentPaymentIconSelected() {
    return selectedPaymentIconSelected2(selectedPaymentBank.value);
  }

  String currentPaymentIconS() {
    return selectedPaymentIconS2(selectedPaymentBank.value);
  }

  String selectedPaymentIconUnSelected(EnumSSPaymentMethod method) {
    return selectedPaymentIconUnSelected2(method.name);
  }

  String selectedPaymentIconUnSelected2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypal.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashapp.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBank.path;
    }
    return ''; // 默认返回值，防止没有匹配情况
  }

  String selectedPaymentIconSelected(EnumSSPaymentMethod method) {
    return selectedPaymentIconSelected2(method.name);
  }

  String selectedPaymentIconSelected2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypal2.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashapp.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBank2.path;
    }
    return ''; // 默认返回值，防止没有匹配情况
  }

  String selectedPaymentIconS(EnumSSPaymentMethod method) {
    return selectedPaymentIconS2(method.name);
  }

  String selectedPaymentIconS2(String method) {
    if (method == EnumSSPaymentMethod.paypal.name) {
      return Assets.img.withddPaypalS.path;
    } else if (method == EnumSSPaymentMethod.cashApp.name) {
      return Assets.img.withddCashappS.path;
    } else if (method == EnumSSPaymentMethod.bank.name) {
      return Assets.img.withddBankS.path;
    }
    return ''; // 默认返回值
  }

  Color bgColor() {
    if (selectedPaymentBank.value == EnumSSPaymentMethod.paypal.name) {
      return Color(0xFF263DD9);
    } else if (selectedPaymentBank.value == EnumSSPaymentMethod.cashApp.name) {
      return Color(0xFF3AAD47);
    } else if (selectedPaymentBank.value == EnumSSPaymentMethod.bank.name) {
      return Color(0xFF000000);
    }
    return Color(0xFF263DD9); // 默认颜色
  }

  var showBalance = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initAvatar();
  }
}
