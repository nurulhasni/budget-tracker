import 'package:budget_tracker/model/transaction_item.dart';
import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class BudgetService extends ChangeNotifier {
  // double _budget = 2000.0;

  // double balance = 0.0;
  // List<TransactionItem> _items = [];

  // //get
  // List<TransactionItem> get items => _items;
  // double get budget => _budget;

  // //set
  // set budget(double value) {
  //   _budget = value;
  //   notifyListeners();
  // }

  // void addItem(TransactionItem item) {
  //   _items.add(item);
  //   updateBalance(item);
  //   notifyListeners();
  // }

  // void updateBalance(TransactionItem item) {
  //   if (item.isExpense) {
  //     balance += item.amount;
  //   } else {
  //     balance -= item.amount;
  //   }
  // }

  double getBudget() => LocalStorageService().getBudget();
  double getBalance() => LocalStorageService().getBalance();

  List<TransactionItem> get items => LocalStorageService().getAllTransaction();
}
