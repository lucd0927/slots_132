// // 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.319764
// import 'package:hive_ce_flutter/hive_flutter.dart';
//
//
// import 'jc_net.dart';
//
// class PBMaiDian {
//   //ad_code_id/ad_format/ad_platform
//   static ad_request({
//     required String ad_code_id,
//     required String ad_format,
//     required String ad_platform,
//   }) {
//     PBWangluo().buryPoint(
//       moistValue: "ad_request",
//       veinKey: "ad_code_id",
//       veinKeyValue: ad_code_id,
//       veinKey2: "ad_format",
//       veinKeyValue2: ad_format,
//       veinKey3: "ad_platform",
//       veinKeyValue3: ad_platform,
//     );
//   }
//
//   static cdyun_ad_return({
//     required String ad_code_id,
//     required String ad_format,
//     required String ad_platform,
//   }) {
//     PBWangluo().buryPoint(
//       moistValue: "cdyun_ad_return",
//       veinKey: "ad_code_id",
//       veinKeyValue: ad_code_id,
//       veinKey2: "ad_format",
//       veinKeyValue2: ad_format,
//       veinKey3: "ad_platform",
//       veinKeyValue3: ad_platform,
//     );
//   }
//
//   static cdyun_ad_chance({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "cdyun_ad_chance",
//       veinKey: "ad_pos_id",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   // ad_pos_id、reason、ad_platform
//   // "ad_pos_id：广告位名称
//   // reason：
//   // -ad_nocache：表示无广告缓存
//   // -nonetwork：无网络
//   // -impfail：展示失败（可能突然死机、卡顿、崩溃或其他问题导致展示失败）
//   // -uninitialized：未初始化广告SDK
//   // -notPrepared：广告未准备好"
//   static cdyun_ad_impression_fail({
//     required String ad_pos_id,
//     required String reason,
//     required String ad_platform,
//   }) {
//     PBWangluo().buryPoint(
//       moistValue: "cdyun_ad_impression_fail",
//       veinKey: "ad_pos_id",
//       veinKeyValue: ad_pos_id,
//       veinKey2: "reason",
//       veinKeyValue2: reason,
//       veinKey3: "ad_platform",
//       veinKeyValue3: ad_platform,
//     );
//   }
//
//   static organic_to_buy() {
//     PBWangluo().buryPoint(moistValue: "organic_to_buy");
//   }
//
//   static session() async {
//     Future.delayed(Duration(milliseconds: 2000), () {
//       PBWangluo().buryPoint(moistValue: "session");
//     });
//   }
//
//   static install() {
//     if (PBLoginGenzhong.qiduoCishu() == 1) {
//       Future.delayed(Duration(milliseconds: 2000), () {
//         PBWangluo().buryPoint(moistValue: "install");
//         PBWangluo().install();
//       });
//     }
//   }
//
//   // source_from: icon、push
//   static launch_page({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "launch_page",
//       veinKey: "source_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   static cloak_req() {
//     PBWangluo().buryPoint(moistValue: "cloak_req");
//   }
//
//   // cloak_user：【0】【1】，对应【黑名单用户】【自然量用户】
//   static cloak_suc({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "cloak_suc",
//       veinKey: "cloak_user",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   static af_req() {
//     PBWangluo().buryPoint(moistValue: "af_req");
//   }
//
//   // af_user:[0] [1]   【0】为A包用户、【1】为B包用户
//   static af_suc() {
//     PBWangluo().buryPoint(moistValue: "af_suc");
//   }
//
//   static new_guide_one() {
//     PBWangluo().buryPoint(moistValue: "new_guide_one");
//   }
//
//   static new_guide_one_c() {
//     PBWangluo().buryPoint(moistValue: "new_guide_one_c");
//   }
//
//   static new_guide_two() {
//     PBWangluo().buryPoint(moistValue: "new_guide_two");
//   }
//
//   static new_guide_two_c() {
//     PBWangluo().buryPoint(moistValue: "new_guide_two_c");
//   }
//
//   static new_guide_three() {
//     PBWangluo().buryPoint(moistValue: "new_guide_three");
//   }
//
//   static new_guide_three_c() {
//     PBWangluo().buryPoint(moistValue: "new_guide_three_c");
//   }
//
//   static new_home_guide() {
//     PBWangluo().buryPoint(moistValue: "new_home_guide");
//   }
//
//   static new_home_guide_c() {
//     PBWangluo().buryPoint(moistValue: "new_home_guide_c");
//   }
//
//   static new_apple_guide() {
//     PBWangluo().buryPoint(moistValue: "new_apple_guide");
//   }
//
//   static new_apple_guide_c() {
//     PBWangluo().buryPoint(moistValue: "new_apple_guide_c");
//   }
//
//   static new_first_prize_pop() {
//     PBWangluo().buryPoint(moistValue: "new_first_prize_pop");
//   }
//
//   static new_first_prize_pop_c() {
//     PBWangluo().buryPoint(moistValue: "new_first_prize_pop_c");
//   }
//
//   static new_quiz_guide() {
//     PBWangluo().buryPoint(moistValue: "new_quiz_guide");
//   }
//
//   static new_quiz_guide_c() {
//     PBWangluo().buryPoint(moistValue: "new_quiz_guide_c");
//   }
//
//   static new_quiz_correct_pop() {
//     PBWangluo().buryPoint(moistValue: "new_quiz_correct_pop");
//   }
//
//   static new_quiz_correct_pop_c() {
//     PBWangluo().buryPoint(moistValue: "new_quiz_correct_pop_c");
//   }
//
//   static new_confirm_account_pop() {
//     PBWangluo().buryPoint(moistValue: "new_confirm_account_pop");
//   }
//
//   static new_confirm_account_pop_c() {
//     PBWangluo().buryPoint(moistValue: "new_confirm_account_pop_c");
//   }
//
//   static input_account_page() {
//     PBWangluo().buryPoint(moistValue: "input_account_page");
//   }
//
//   static input_account_page_c() {
//     PBWangluo().buryPoint(moistValue: "input_account_page_c");
//   }
//
//   static account_suc_pop() {
//     PBWangluo().buryPoint(moistValue: "account_suc_pop");
//   }
//
//   static account_suc_pop_c() {
//     PBWangluo().buryPoint(moistValue: "account_suc_pop_c");
//   }
//
//   // pop_from:new/old
//   static grow_bonus_pop({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "grow_bonus_pop",
//       veinKey: "pop_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   static grow_bonus_pop_c() {
//     PBWangluo().buryPoint(moistValue: "grow_bonus_pop_c");
//   }
//
//   static home_page() {
//     PBWangluo().buryPoint(moistValue: "home_page");
//   }
//
//   static home_page_withdraw() {
//     PBWangluo().buryPoint(moistValue: "home_page_withdraw");
//   }
//
//   static home_float_c() {
//     PBWangluo().buryPoint(moistValue: "home_float_c");
//   }
//
//   static home_float_wheel() {
//     PBWangluo().buryPoint(moistValue: "home_float_wheel");
//   }
//
//   static home_float_quiz() {
//     PBWangluo().buryPoint(moistValue: "home_float_quiz");
//   }
//
//   static home_float_apple() {
//     PBWangluo().buryPoint(moistValue: "home_float_apple");
//   }
//
//   static home_list_showpig() {
//     PBWangluo().buryPoint(moistValue: "home_list_showpig");
//   }
//
//   static showpig_page() {
//     PBWangluo().buryPoint(moistValue: "showpig_page");
//   }
//
//   static showpig_page_c() {
//     PBWangluo().buryPoint(moistValue: "showpig_page_c");
//   }
//
//   // pop_from:quiz、wheel
//   static double_pop({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "double_pop",
//       veinKey: "pop_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   // pop_from:quiz、wheel
//   static double_pop_c({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "double_pop_c",
//       veinKey: "pop_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   static h5_c() {
//     PBWangluo().buryPoint(moistValue: "h5_c");
//   }
//
//   static no_chance_pop() {
//     PBWangluo().buryPoint(moistValue: "no_chance_pop");
//   }
//
//   static no_chance_pop_c() {
//     PBWangluo().buryPoint(moistValue: "no_chance_pop_c");
//   }
//
//   static diamond_pig_getpop() {
//     PBWangluo().buryPoint(moistValue: "diamond_pig_getpop");
//   }
//
//   static diamond_pig_getpop_c() {
//     PBWangluo().buryPoint(moistValue: "diamond_pig_getpop_c");
//   }
//
//   static diamond_pig_guide() {
//     PBWangluo().buryPoint(moistValue: "diamond_pig_guide");
//   }
//
//   static gold_pig_getpop() {
//     PBWangluo().buryPoint(moistValue: "gold_pig_getpop");
//   }
//
//   static gold_pig_getpop_c() {
//     PBWangluo().buryPoint(moistValue: "gold_pig_getpop_c");
//   }
//
//   static gold_pig_guide() {
//     PBWangluo().buryPoint(moistValue: "gold_pig_guide");
//   }
//
//   static h5_page() {
//     PBWangluo().buryPoint(moistValue: "h5_page");
//   }
//
//   static quiz_page() {
//     PBWangluo().buryPoint(moistValue: "quiz_page");
//   }
//
//   static answer_true_c() {
//     PBWangluo().buryPoint(moistValue: "answer_true_c");
//   }
//
//   static answer_wrong_c() {
//     PBWangluo().buryPoint(moistValue: "answer_wrong_c");
//   }
//
//   static quiz_wheel_c() {
//     PBWangluo().buryPoint(moistValue: "quiz_wheel_c");
//   }
//
//   static cash_queue_pop() {
//     PBWangluo().buryPoint(moistValue: "cash_queue_pop");
//   }
//
//   static cash_queue_po_c() {
//     PBWangluo().buryPoint(moistValue: "cash_queue_po_c");
//   }
//
//   static one_last_step_pop() {
//     PBWangluo().buryPoint(moistValue: "one_last_step_pop");
//   }
//
//   static one_last_step_pop_c() {
//     PBWangluo().buryPoint(moistValue: "one_last_step_pop_c");
//   }
//
//   static cash_suc_pop() {
//     PBWangluo().buryPoint(moistValue: "cash_suc_pop");
//   }
//
//   static cash_suc_pop_c() {
//     PBWangluo().buryPoint(moistValue: "cash_suc_pop_c");
//   }
//
//   static cash_not_pop() {
//     PBWangluo().buryPoint(moistValue: "cash_not_pop");
//   }
//
//   static cash_not_pop_c() {
//     PBWangluo().buryPoint(moistValue: "cash_not_pop_c");
//   }
//
//   //type:local、fix、fcm
//   static inform_p({required String veinKeyValue}) {
//     Future.delayed(Duration(milliseconds: 2000), () {
//       PBWangluo().buryPoint(
//         moistValue: "inform_p",
//         veinKey: "type",
//         veinKeyValue: veinKeyValue,
//       );
//     });
//   }
//
//   //type:local、fix、fcm
//   static inform_c({required String veinKeyValue}) {
//     Future.delayed(Duration(milliseconds: 2000), () {
//       PBWangluo().buryPoint(
//         moistValue: "inform_c",
//         veinKey: "type",
//         veinKeyValue: veinKeyValue,
//       );
//     });
//   }
//
//   static inform_back_pop() {
//     PBWangluo().buryPoint(moistValue: "inform_back_pop");
//   }
//
//   static no_network_pop() {
//     PBWangluo().buryPoint(moistValue: "no_network_pop");
//   }
//
//   static ad_fail_pop() {
//     PBWangluo().buryPoint(moistValue: "ad_fail_pop");
//   }
//
//   static ad_limit_pop() {
//     PBWangluo().buryPoint(moistValue: "ad_limit_pop");
//   }
//
//   // money_from:5,10,15,20,25,30...(每隔5一个档位，上不封顶）
//   static cash_money_detail({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "cash_money_detail",
//       veinKey: "money_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//   //ad_from:5,10,15,20,25,30,35,40...（每隔5一个档位，上不封顶）
//   static cash_ad_detail({required String veinKeyValue}) {
//     PBWangluo().buryPoint(
//       moistValue: "cash_ad_detail",
//       veinKey: "ad_from",
//       veinKeyValue: veinKeyValue,
//     );
//   }
//
//
//   // 0 失败 1 成功
//   static eu_user(String resssss) async {
//     PBWangluo().buryPoint(
//       moistValue: "eu_user",
//       veinKey: "adj_user",
//       veinKeyValue: "$resssss",
//     );
//   }  static ad_privacypop_fail(String reeee) async {
//     PBWangluo().buryPoint(
//       moistValue: "ad_privacypop_fail",
//       veinKey: "reason",
//       veinKeyValue: "$reeee",
//     );
//   }
//
//   static ad_privacypop_suc() async {
//     PBWangluo().buryPoint(moistValue: "ad_privacypop_suc");
//   }
// }
