// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.325232

import 'config_dev.dart';
import 'config_prod.dart';
import 'enum_app_evn.dart';

abstract class PBPeizhi {

  static PBPeizhiEnv? _env;

  static PBPeizhiEnv get env => _env ?? PBPeizhiEnv.dev;
  static bool isDEV(){
    return env == PBPeizhiEnv.dev;
  }
  static bool isProd(){
    return env == PBPeizhiEnv.prod;
  }
  static initEvn(PBPeizhiEnv env){
    _env = env;
  }
  static PBPeizhi? _instance;
  static PBPeizhi get instance => _getInstance();

  static PBPeizhi  _getInstance(){
    switch(_env){
      case PBPeizhiEnv.dev:
        _instance = PBPeizhiDev();
        break;
      case PBPeizhiEnv.prod:
        _instance = PBPeizhiProd();
        break;
      default:
        _instance = PBPeizhiProd();
    }
    return _instance!;
  }



  String baseUrl();
  String tttbbbaaaUrl();



}    
