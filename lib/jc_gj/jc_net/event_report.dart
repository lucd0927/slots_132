// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.319764
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:slots_132/jc_gj/denglugengzhong.dart';
import 'package:slots_132/jc_gj/jc_net/http_dio.dart';
import 'package:slots_132/jc_gj/log.dart';

class SSEventReporttttt {
  //ad_code_id/ad_format/ad_platform
  static ad_request({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "ad_request",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  static eyomt_ad_return({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_return",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  static eyomt_ad_return_fail({
    required String ad_code_id,
    required String ad_format,
    required String ad_platform,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_return_fail",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  static eyomt_ad_chance({required String veinKeyValue}) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_chance",
      veinKey: "ad_pos_id",
      veinKeyValue: veinKeyValue,
    );
  }

  // ad_pos_id、reason、ad_platform
  // "ad_pos_id：广告位名称
  // reason：
  // -ad_nocache：表示无广告缓存
  // -nonetwork：无网络
  // -impfail：展示失败（可能突然死机、卡顿、崩溃或其他问题导致展示失败）
  // -uninitialized：未初始化广告SDK
  // -notPrepared：广告未准备好"
  static eyomt_ad_impression_fail({
    required String ad_pos_id,
    required String reason,
    required String ad_platform,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_impression_fail",
      veinKey: "ad_pos_id",
      veinKeyValue: ad_pos_id,
      veinKey2: "reason",
      veinKeyValue2: reason,
      veinKey3: "ad_platform",
      veinKeyValue3: ad_platform,
    );
  }

  // ad_platform、ad_init_time
  static eyomt_ad_initsuc({
    required String ad_init_time,
    required String ad_platform,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_initsuc",
      veinKey: "ad_init_time",
      veinKeyValue: ad_init_time,
      veinKey2: "ad_platform",
      veinKeyValue2: ad_platform,
    );
  }

  static eyomt_ad_impre_close({
    required String ad_code_id,
    required String ad_pos_id,
    required String ad_format,
  }) {
    SSHttpDio().buryPoint(
      moistValue: "eyomt_ad_impre_close",
      veinKey: "ad_code_id",
      veinKeyValue: ad_code_id,
      veinKey2: "ad_format",
      veinKeyValue2: ad_format,
      veinKey3: "ad_pos_id",
      veinKeyValue3: ad_pos_id,
    );
  }

  static session() async {
    Future.delayed(Duration(milliseconds: 2000), () {
      SSHttpDio().buryPoint(moistValue: "session");
      SSHttpDio().session();
    });
  }

  static install() {

    if (SSDlTracking.qiduoCishu() == 1) {
      Future.delayed(Duration(milliseconds: 2000), () {

        SSHttpDio().buryPoint(moistValue: "install");
        SSHttpDio().install();
      });
    }
  }

  static launch_page() {
    SSHttpDio().buryPoint(moistValue: "launch_page");
  }

  // source_from:NORMAL（正常模式）、FREESPIN（FREESPIN模式）
  static home_page({required String source_from}) {
    SSHttpDio().buryPoint(
      moistValue: "home_page",
      veinKey: "source_from",
      veinKeyValue: source_from,
    );
  }

  static home_page_spin() {
    SSHttpDio().buryPoint(moistValue: "home_page_spin");
  }

  static home_page_cash_out() {
    SSHttpDio().buryPoint(moistValue: "home_page_cash_out");
  }

  static home_page_wheel() {
    SSHttpDio().buryPoint(moistValue: "home_page_wheel");
  }

  static home_page_bet() {
    SSHttpDio().buryPoint(moistValue: "home_page_bet");
  }

  static home_page_gift() {
    SSHttpDio().buryPoint(moistValue: "home_page_gift");
  }

  static home_page_phone() {
    SSHttpDio().buryPoint(moistValue: "home_page_phone");
  }

  static home_page_star() {
    SSHttpDio().buryPoint(moistValue: "home_page_star");
  }

  static home_page_menu() {
    SSHttpDio().buryPoint(moistValue: "home_page_menu");
  }

  static home_page_exp() {
    SSHttpDio().buryPoint(moistValue: "home_page_exp");
  }

  static setting_page_paytable() {
    SSHttpDio().buryPoint(moistValue: "setting_page_paytable");
  }

  static setting_page_contact_us() {
    SSHttpDio().buryPoint(moistValue: "setting_page_contact_us");
  }

  static setting_page_privacy() {
    SSHttpDio().buryPoint(moistValue: "setting_page_privacy");
  }

  static elve_page() {
    SSHttpDio().buryPoint(moistValue: "elve_page");
  }

  static elve_page_open() {
    SSHttpDio().buryPoint(moistValue: "elve_page_open");
  }

  static phone_page() {
    SSHttpDio().buryPoint(moistValue: "phone_page");
  }

  static phone_page_claim() {
    SSHttpDio().buryPoint(moistValue: "phone_page_claim");
  }

  static phone_input_name_pop() {
    SSHttpDio().buryPoint(moistValue: "phone_input_name_pop");
  }

  static phone_input_name_pop_claim() {
    SSHttpDio().buryPoint(moistValue: "phone_input_name_pop_claim");
  }

  static phone_piece_spin() {
    SSHttpDio().buryPoint(moistValue: "phone_piece_spin");
  }

  static map_page() {
    SSHttpDio().buryPoint(moistValue: "map_page");
  }

  static map_page_collect() {
    SSHttpDio().buryPoint(moistValue: "map_page_collect");
  }

  static wheel_page() {
    SSHttpDio().buryPoint(moistValue: "wheel_page");
  }

  static wheel_page_spin() {
    SSHttpDio().buryPoint(moistValue: "wheel_page_spin");
  }

  static wheel_gift_pop() {
    SSHttpDio().buryPoint(moistValue: "wheel_gift_pop");
  }

  static wheel_gift_pop_claim() {
    SSHttpDio().buryPoint(moistValue: "wheel_gift_pop_claim");
  }

  static wheel_gift_pop_close() {
    SSHttpDio().buryPoint(moistValue: "wheel_gift_pop_close");
  }

  static wheel_more_pop() {
    SSHttpDio().buryPoint(moistValue: "wheel_more_pop");
  }

  static wheel_more_pop_tap() {
    SSHttpDio().buryPoint(moistValue: "wheel_more_pop_tap");
  }

  static wheel_more_pop_close() {
    SSHttpDio().buryPoint(moistValue: "wheel_more_pop_close");
  }

  static sign_page() {
    SSHttpDio().buryPoint(moistValue: "sign_page");
  }

  static sign_page_claim() {
    SSHttpDio().buryPoint(moistValue: "sign_page_claim");
  }

  static sign_page_close() {
    SSHttpDio().buryPoint(moistValue: "sign_page_close");
  }

  static bonus_page() {
    SSHttpDio().buryPoint(moistValue: "bonus_page");
  }

  static bonus_page_click() {
    SSHttpDio().buryPoint(moistValue: "bonus_page_click");
  }

  static free_spin_add_chance() {
    SSHttpDio().buryPoint(moistValue: "free_spin_add_chance");
  }

  static free_spin_single_slots() {
    SSHttpDio().buryPoint(moistValue: "free_spin_single_slots");
  }

  static free_spin_cash() {
    SSHttpDio().buryPoint(moistValue: "free_spin_cash");
  }

  // "pop_type: wow、super_win、mega_win、big_win
  // pop_from:spin、bonus、single_slots"
  static cash_pop({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "cash_pop",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  // "pop_type: wow、super_win、mega_win、big_win
  // pop_from:spin、bonus、single_slots"
  static cash_pop_collect({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "cash_pop_collect",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  // "pop_type: wow、super_win、mega_win、big_win
  // pop_from:spin、bonus、single_slots"
  static cash_pop_close({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "cash_pop_close",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  // "pop_type:mini、major、grand
  // pop_from:spin、bonus"
  static jackpot_pop({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "jackpot_pop",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  // "pop_type:mini、major、grand
  // pop_from:spin、bonus"
  static jackpot_pop_claim_all({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "jackpot_pop_claim_all",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  // "pop_type:mini、major、grand
  // pop_from:spin、bonus"
  static jackpot_pop_claim_10({required String pop_type, required String pop_from}) {
    SSHttpDio().buryPoint(
      moistValue: "jackpot_pop_claim_10",

      veinKey: "pop_type",
      veinKeyValue: pop_type,
      veinKey2: "pop_from",
      veinKeyValue2: pop_from,
    );
  }

  static cash_out_page() {
    SSHttpDio().buryPoint(moistValue: "cash_out_page");
  }

  static cash_out_page_add() {
    SSHttpDio().buryPoint(moistValue: "cash_out_page_add");
  }

  static cash_out_page_withdraw() {
    SSHttpDio().buryPoint(moistValue: "cash_out_page_withdraw");
  }

  static vip_partner_click() {
    SSHttpDio().buryPoint(moistValue: "vip_partner_click");
  }

  static vip_partner_become_pop() {
    SSHttpDio().buryPoint(moistValue: "vip_partner_become_pop");
  }

  static transaction_history_page() {
    SSHttpDio().buryPoint(moistValue: "transaction_history_page");
  }

  static insufficient_pop() {
    SSHttpDio().buryPoint(moistValue: "insufficient_pop");
  }

  static insufficient_pop_spin() {
    SSHttpDio().buryPoint(moistValue: "insufficient_pop_spin");
  }

  static insufficient_pop_close() {
    SSHttpDio().buryPoint(moistValue: "insufficient_pop_close");
  }

  static sending_money_pop() {
    SSHttpDio().buryPoint(moistValue: "sending_money_pop");
  }

  static transaction_fee_pop() {
    SSHttpDio().buryPoint(moistValue: "transaction_fee_pop");
  }

  static cover_pop() {
    SSHttpDio().buryPoint(moistValue: "cover_pop");
  }
  static cover_pop_spin() {
    SSHttpDio().buryPoint(moistValue: "cover_pop_spin");
  }
  static rank_pop() {
    SSHttpDio().buryPoint(moistValue: "rank_pop");
  }
  static rank_pop_boost() {
    SSHttpDio().buryPoint(moistValue: "rank_pop_boost");
  }
  static boost_pop() {
    SSHttpDio().buryPoint(moistValue: "boost_pop");
  }
  static boost_pop_quick() {
    SSHttpDio().buryPoint(moistValue: "boost_pop_quick");
  }
  static boost_pop_standard() {
    SSHttpDio().buryPoint(moistValue: "boost_pop_standard");
  }
  static verfication_pop() {
    SSHttpDio().buryPoint(moistValue: "verfication_pop");
  }
  static verfication_start() {
    SSHttpDio().buryPoint(moistValue: "verfication_start");
  }
  static verfication_close() {
    SSHttpDio().buryPoint(moistValue: "verfication_close");
  }
  static suc_pop() {
    SSHttpDio().buryPoint(moistValue: "suc_pop");
  }
  static partner_pop() {
    SSHttpDio().buryPoint(moistValue: "partner_pop");
  }
  static partner_yes() {
    SSHttpDio().buryPoint(moistValue: "partner_yes");
  }
  static partner_level_100() {
    SSHttpDio().buryPoint(moistValue: "partner_level_100");
  }
  static partner_level_100_claim() {
    SSHttpDio().buryPoint(moistValue: "partner_level_100_claim");
  }
  static chat_page() {
    SSHttpDio().buryPoint(moistValue: "chat_page");
  }
  static chat_page_send() {
    SSHttpDio().buryPoint(moistValue: "chat_page_send");
  }
  static chat_page_reply() {
    SSHttpDio().buryPoint(moistValue: "chat_page_reply");
  }
  // source_from: time、lock、noti_fcm、data_fcm
  static all_noti_t({required String source_from}) {
    SSHttpDio().buryPoint(
      moistValue: "all_noti_t",
      veinKey: "source_from",
      veinKeyValue: source_from,
    );
  }
  // source_from: time、lock、noti_fcm、data_fcm
  static all_noti_c({required String source_from}) {
    SSHttpDio().buryPoint(
      moistValue: "all_noti_c",
      veinKey: "source_from",
      veinKeyValue: source_from,
    );
  }
  static noti_pop() {
    SSHttpDio().buryPoint(moistValue: "noti_pop");
  }
  static noti_pop_claim() {
    SSHttpDio().buryPoint(moistValue: "noti_pop_claim");
  }
  static push_reopen_pop() {
    SSHttpDio().buryPoint(moistValue: "push_reopen_pop");
  }
  static push_repopen_pop_notify() {
    SSHttpDio().buryPoint(moistValue: "push_repopen_pop_notify");
  }
  static push_reopen_pop_close() {
    SSHttpDio().buryPoint(moistValue: "push_reopen_pop_close");
  }
  //number_type:100、200、300...1000
  static cash_numer({required String number_type}) {
    SSHttpDio().buryPoint(
      moistValue: "cash_numer",
      veinKey: "number_type",
      veinKeyValue: number_type,
    );
  }
  // pv_type：1，5，10，15，20...100
  static pv_numer({required String pv_type}) {
    SSHttpDio().buryPoint(
      moistValue: "pv_numer",
      veinKey: "pv_type",
      veinKeyValue: pv_type,
    );
  }
  // level_type:1，2，3，4...100
  static level_number({required String level_type}) {
    SSHttpDio().buryPoint(
      moistValue: "level_number",
      veinKey: "level_type",
      veinKeyValue: level_type,
    );
  }
}
