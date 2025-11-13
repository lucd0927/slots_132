import 'package:get/get.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';

class PhoneCardController extends GetxController {
  static PhoneCardController get to => Get.find();


  final box = SSHive.box;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ssLogggg("PhoneCardController onInit");
  }
}

