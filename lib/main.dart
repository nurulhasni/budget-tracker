import 'package:budget_tracker/services/budget_service.dart';
import 'package:budget_tracker/services/local_storage_service.dart';
import 'package:budget_tracker/services/theme_service.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';
import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locaStorageService = LocalStorageService();
  await locaStorageService.initalizeHive();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({required this.sharedPreferences, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeService>(
            create: (_) => ThemeService(sharedPreferences: sharedPreferences)),
        ChangeNotifierProvider<BudgetService>(create: (_) => BudgetService())
      ],
      child: Builder(builder: (BuildContext context) {
        final themeService = Provider.of<ThemeService>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor:
                  themeService.darkTheme ? Colors.black : Colors.indigo,
              colorScheme: ColorScheme.fromSwatch(
                      primarySwatch: Colors.indigo,
                      brightness: themeService.darkTheme
                          ? Brightness.dark
                          : Brightness.light,
                      backgroundColor:
                          themeService.darkTheme ? Colors.black : Colors.white)
                  .copyWith(secondary: Colors.indigo)),
          home: Home(),
        );
      }),
    );

    // MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //       colorScheme: ColorScheme.fromSwatch(
    //               primarySwatch: Colors.indigo,
    //               brightness: Brightness.dark,
    //               backgroundColor: Colors.black)
    //           .copyWith(secondary: Colors.indigo.shade200)),
    //   home: Home(),
    // );
  }
}
