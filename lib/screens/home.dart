import 'package:budget_tracker/pages/home_page.dart';
import 'package:budget_tracker/pages/profile_page.dart';
import 'package:budget_tracker/services/budget_service.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:budget_tracker/widgets/add_budget_dialog.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ];

  List<Widget> pages = const [HomePage(), ProfilePage()];

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Tracker"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AddBudgetDialog(budgetToAdd: (budget) {
                        final budgetService =
                            Provider.of<BudgetService>(context, listen: false);
                        //set update value for ui
                        budgetService.budget = budget;
                      });
                    });
              },
              icon: const Icon(Icons.attach_money))
        ],
        leading: IconButton(
            onPressed: () {
              //ini adalah set                 dan ini adalah get
              themeService.darkTheme = !themeService.darkTheme;
            },
            icon: Icon(
                //get
                themeService.darkTheme ? Icons.wb_sunny : Icons.dark_mode)),
      ),
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
