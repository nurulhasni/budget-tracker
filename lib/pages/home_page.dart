import 'package:budget_tracker/cards/transaction_card.dart';
// import 'package:budget_tracker/model/transaction_item.dart'; //no need  for anymore
import 'package:budget_tracker/services/budget_service.dart';
import 'package:budget_tracker/widgets/add_transaction_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final budgetService = Provider.of<BudgetService>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddTransactionDialog(itemToAdd: (transactionItem) {
                  final budgetService =
                      Provider.of<BudgetService>(context, listen: false);
                  budgetService.addItem(transactionItem);
                  // setState(() { //No need for anymore
                  //   items.add(transactionItem);
                  // });
                });
              });
          // setState(() {
          //   items.add(TransactionItem(amount: 5.99, text: "Food"));
          // });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Consumer<BudgetService>(
                    builder: (context, value, child) {
                      return CircularPercentIndicator(
                        radius: screenSize.width / 2,
                        lineWidth: 10.0,
                        percent: value.balance / value.budget,
                        backgroundColor: Colors.white,
                        center: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "\$" + value.balance.toString().split("0")[0],
                              style: TextStyle(
                                  fontSize: 48, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Balance",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Budget: \$" + budgetService.budget.toString(),
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        progressColor: Theme.of(context).colorScheme.primary,
                      );
                    },
                  )),
              const SizedBox(
                height: 35,
              ),
              const Text("Items",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              // ...List.generate(items.length,
              //     (index) => TransactionCard(transactionItem: items[index]))
              Consumer<BudgetService>(builder: (context, value, child) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: value.items.length,
                    itemBuilder: (context, index) {
                      return TransactionCard(
                          transactionItem: value.items[index]);
                    });
              })
            ],
          ),
        ),
      )),
    );
  }
}
