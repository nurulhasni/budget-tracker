import 'package:budget_tracker/model/transaction_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();
  static const String transactionBoxKey = "balanceBox";
  static const String balanceBoxKey = "balanceBox";
  static const String budgetBoxKey = "budgetBox";

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  Future<void> initalizeHive() async {
    await Hive.initFlutter();

    await Hive.openBox<double>(budgetBoxKey);
    await Hive.openBox<TransactionItem>(transactionBoxKey);
    await Hive.openBox<double>(balanceBoxKey);
  }

  void saveTransactionItem(TransactionItem transaction) {
    Hive.box<TransactionItem>(transactionBoxKey).add(transaction);
    saveBalance(transaction);
  }

  List<TransactionItem> getAllTransaction() {
    return Hive.box<TransactionItem>(transactionBoxKey).values.toList();
  }

  Future<void> saveBalance(TransactionItem item) async {
    final balanceBox = Hive.box<double>(balanceBoxKey);
    final currentBalance = balanceBox.get("balance") ?? 0.0;
    if (item.isExpense) {
      balanceBox.put("balance", currentBalance + item.amount);
    } else {
      balanceBox.put("balance", currentBalance - item.amount);
    }
  }

  double getBalance() {
    return Hive.box<double>(balanceBoxKey).get("balance") ?? 0.0;
  }

  double getBudget() {
    return Hive.box<double>(budgetBoxKey).get("budget") ?? 2000.0;
  }

  Future<void> saveBudget(double budget) {
    return Hive.box<double>(budgetBoxKey).put("budget", budget);
  }
}
