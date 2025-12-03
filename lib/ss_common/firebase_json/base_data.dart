
import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';

class SSFBBaseData{


  static int claus_spin(){
    String key = PBFireBbbbbb().by(name: "claus_spin");

    if(key.isNotEmpty){
      return int.tryParse(key)??5;
    }
    return 5;
  }

  static int fee_spin(){
    String key = PBFireBbbbbb().by(name: "fee_spin");

    if(key.isNotEmpty){
      return int.tryParse(key)??5;
    }
    return 10;
  }

  static int human_spin(){
    String key = PBFireBbbbbb().by(name: "human_spin");

    if(key.isNotEmpty){
      return int.tryParse(key)??10;
    }
    return 10;
  }
}