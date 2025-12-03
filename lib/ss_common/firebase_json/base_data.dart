
import 'package:slots_132/jc_ad/guiyin/firebbbbbb.dart';

class SSFBBaseData{


  static int claus_spin(){
    String key = PBFireBbbbbb().by(name: "claus_spin");

    if(key.isNotEmpty){
      return int.tryParse(key)??5;
    }

    return 5;

  }
}