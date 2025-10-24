import 'dart:convert';

class PBBaseUtils {



  //加密：“data”：原始字符串；“code”：需求文档标题前的项目编号
  static String encrypt(String data, int code) {
    final dataBytes = utf8.encode(data);
    List<int> xorList = [];
    for (int i = 0; i < dataBytes.length; i++) {
      xorList.add(dataBytes[i] ^ code);
    }
    return base64.encode(xorList);
  }

  //解密：“data”：加密字符串；“code”：需求文档标题前的项目编号
  static String decrypt(String data, int code) {
    final decode = base64.decode(data);
    final decode2 = decode.toList();
    List<int> xorList = [];
    for (int i = 0; i < decode2.length; i++) {
      xorList.add(decode2[i] ^ code);
    }
    return utf8.decode(xorList);
  }

}    


void main(){
  String max = PBBaseUtils.encrypt("MWJzhnEPtKqxLKRLAlVrTyQfO2VxWZWtVx_SzTWC_MgoZL7kTKNt9t3M_OgIZ24nBXRXxVd9ogQEp7616TWf3C", 117);
  String fengkong = PBBaseUtils.encrypt("MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAMYl4KczbxQYcRCOgSH0lzRtfuI/jffXOXpHUXRVm3CRiyNL4M5U0Vy3qC+HO64/a1ZZ2FFcKLG69oOvUkCuMr0CAwEAAQ==", 117);
  print("==encrypt=:$fengkong");
  String dd = PBBaseUtils.decrypt(fengkong,117);
  print("==decrypt=:$dd");
}