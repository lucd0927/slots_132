// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.325232

import 'config_dev.dart';
import 'config_prod.dart';
import 'enum_app_evn.dart';

abstract class SSHuanjing {

  static SSHuanjingEnv? _env;

  static SSHuanjingEnv get env => _env ?? SSHuanjingEnv.prod;
  static bool hasDevvvvv(){
    return env == SSHuanjingEnv.dev;
  }
  static bool hasPppord(){
    return env == SSHuanjingEnv.prod;
  }
  static initEvn(SSHuanjingEnv env){
    _env = env;
  }
  static SSHuanjing? _instance;
  static SSHuanjing get instance => _getInstance();

  static SSHuanjing  _getInstance(){
    switch(_env){
      case SSHuanjingEnv.dev:
        _instance = SSHuanjingDev();
        break;
      case SSHuanjingEnv.prod:
        _instance = SSHuanjingProd();
        break;
      default:
        _instance = SSHuanjingProd();
    }
    return _instance!;
  }



  String bUuuu();
  String tbaUuuuu();



}    
