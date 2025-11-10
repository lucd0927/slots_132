import 'package:get/get.dart';
import 'package:slots_132/jc_hive/sshive.dart';

import 'dart:convert';

class TransactionItem {
  final String id;
  final String title;
  final DateTime date;
  final String channel;
  final double amount;

  TransactionItem({
    required this.id,
    required this.title,
    required this.date,
    required this.channel,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'channel': channel,
      'amount': amount,
    };
  }

  factory TransactionItem.fromMap(Map<String, dynamic> m) {
    return TransactionItem(
      id: m['id'] as String,
      title: m['title'] as String,
      date: DateTime.parse(m['date'] as String),
      channel: m['channel'] as String,
      amount: (m['amount'] as num).toDouble(),
    );
  }

  String toJson() => jsonEncode(toMap());
  factory TransactionItem.fromJson(String s) => TransactionItem.fromMap(jsonDecode(s));
}


class TransactionGroup {
  final String title;
  final List<TransactionItem> items;
  TransactionGroup({required this.title, required this.items});
}


class HistoryController extends GetxController {
  static HistoryController get to => Get.find();

  final box = SSHive.box;
  final String _key = 'transactions';
  final RxList<TransactionItem> transactions = <TransactionItem>[].obs;

  @override
  void onInit() {
    super.onInit();

    // 若使用 Hive 原生对象存储可以使用 Adapter；这里示例用字符串列表存储（兼容性好）
    _loadFromBox();

    // 自动保存：当列表变化时持久化
    ever<List<TransactionItem>>(transactions, (_) => _saveToBox());
  }

  void _loadFromBox() {
    final stored = box.get(_key);
    if (stored == null) {
      // 初始示例数据（可删除）
      final sample = [
        TransactionItem(
          id: 't1',
          title: 'Withdraw',
          date: DateTime.parse('2025-02-02T19:32:00'),
          channel: 'cash',
          amount: -5.99,
        ),
        TransactionItem(
          id: 't2',
          title: 'Big Win',
          date: DateTime.parse('2025-02-02T19:32:00'),
          channel: 'cash',
          amount: 5.99,
        ),
        TransactionItem(
          id: 't3',
          title: 'Withdraw',
          date: DateTime.parse('2025-02-01T19:32:00'),
          channel: 'paypal',
          amount: -5.99,
        ),
        TransactionItem(
          id: 't4',
          title: 'Paypal',
          date: DateTime.parse('2025-02-01T19:32:00'),
          channel: 'paypal',
          amount: 5.99,
        ),
      ];
      transactions.assignAll(sample);
      _saveToBox();
      return;
    }

    // 支持两种存储格式：List\<String\> 的 JSON 或 List\<Map\>
    if (stored is List) {
      final List<TransactionItem> list = [];
      for (final e in stored) {
        if (e is String) {
          list.add(TransactionItem.fromJson(e));
        } else if (e is Map) {
          list.add(TransactionItem.fromMap(Map<String, dynamic>.from(e)));
        }
      }
      transactions.assignAll(list);
    }
  }

  void _saveToBox() {
    // 将每项序列化为 JSON 字符串存储，兼容性较好
    final List<String> serialized = transactions.map((t) => t.toJson()).toList();
    box.put(_key, serialized);
  }

  void addTransaction(TransactionItem item) {
    transactions.insert(0, item); // 新条目插入顶部
  }

  void removeTransactionById(String id) {
    transactions.removeWhere((t) => t.id == id);
  }

  void clearAll() {
    transactions.clear();
  }

  /// 按日期分组，返回 Map\<yyyy-MM-dd, List\<TransactionItem\>\>
  Map<String, List<TransactionItem>> groupedByDate() {
    final Map<String, List<TransactionItem>> map = {};
    for (final t in transactions) {
      final key = '${t.date.year.toString().padLeft(4, '0')}/${t.date.month.toString().padLeft(2, '0')}/${t.date.day.toString().padLeft(2, '0')}';
      map.putIfAbsent(key, () => []).add(t);
    }
    return map;
  }
}

