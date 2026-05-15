import 'package:bkash_app/data/model/home_menu_item_model.dart';
import 'package:bkash_app/data/model/transaction_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isExpanded = false;
  bool get isExpanded => _isExpanded;

  double _balance = 15750.50;
  double get balance => _balance;

  final List<HomeMenuItemModel> _allItems = HomeMenuItemModel.sampleData;

  List<HomeMenuItemModel> get visibleItems {
    if (_isExpanded) {
      return _allItems;
    } else {
      return _allItems.take(8).toList();
    }
  }

  List<TransactionModel> get transactions => [
    TransactionModel(
      id: '1',
      title: 'Send Money to Jannat',
      amount: -500,
      date: DateTime.now().subtract(const Duration(hours: 2)),
      icon: Icons.send,
    ),
    TransactionModel(
      id: '2',
      title: 'Mobile Recharge - Robi',
      amount: -300,
      date: DateTime.now().subtract(const Duration(hours: 5)),
      icon: Icons.phone_android,
    ),
    TransactionModel(
      id: '3',
      title: 'Received from Ahmed',
      amount: 1000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: Icons.call_received,
    ),
    TransactionModel(
      id: '4',
      title: 'Cash Out - BRAC Bank',
      amount: -2000,
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: Icons.account_balance_wallet,
    ),
  ];

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  void updateBalance(double amount) {
    _balance = amount;
    notifyListeners();
  }
}
