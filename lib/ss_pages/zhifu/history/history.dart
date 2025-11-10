// dart
import 'package:flutter/material.dart';
import 'package:slots_132/ss_pages/zhifu/history/history_c.dart';

class Historyyyy extends StatefulWidget {
  const Historyyyy({super.key});

  @override
  State<Historyyyy> createState() => _HistoryyyyState();
}

class _HistoryyyyState extends State<Historyyyy> {
  late List<TransactionGroup> groups;

  @override
  void initState() {
    super.initState();
    groups = _sampleGroups();
  }

  List<TransactionGroup> _sampleGroups() {
    return [];
  }

  void _removeItem(String id) {
    setState(() {
      for (final g in groups) {
        g.items.removeWhere((it) => it.id == id);
      }
      groups.removeWhere((g) => g.items.isEmpty);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已删除')));
  }

  Color _amountColor(double v) => v >= 0 ? Colors.green : Colors.red;

  String _formatAmount(double v) {
    final sign = v >= 0 ? '+' : '-';
    final absStr = v
        .abs()
        .toStringAsFixed(2)
        .replaceAll('.', ','); // 使用逗号小数点符合示例
    return '$sign \$$absStr';
  }

  Widget _buildItem(TransactionItem item) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete_forever, color: Colors.white),
      ),
      onDismissed: (_) => _removeItem(item.id),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          leading: _buildLeading(item.channel),
          title: Text(
            item.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            "item.subtitle",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          trailing: Text(
            _formatAmount(item.amount),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _amountColor(item.amount),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(String channel) {
    if (channel.toLowerCase().contains('paypal')) {
      return Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            Icons.account_balance_wallet,
            color: Colors.blue.shade700,
          ),
        ),
      );
    }
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF2EE0A3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(child: Icon(Icons.attach_money, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // flatten groups into a list of widgets (header + items)
    final List<Widget> children = [];
    for (final g in groups) {
      children.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Text(
            g.title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
      children.addAll(g.items.map(_buildItem));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black87),
        title: const Text(
          'Transaction History',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        children: children,
      ),
    );
  }
}
