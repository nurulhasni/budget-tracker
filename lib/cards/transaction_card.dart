import 'package:budget_tracker/model/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final TransactionItem transactionItem;
  const TransactionCard({required this.transactionItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  offset: const Offset(0, 25),
                  blurRadius: 50)
            ]),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Text(
              transactionItem.text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            Text(
              (transactionItem.isExpense ? "+ " : "- ") +
                  transactionItem.amount.toString(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
