import 'package:finance_with_notion/pages/initial/initial.page.dart';
import 'package:finance_with_notion/shared/config/app_config.dart';
import 'package:flutter/material.dart';

void main() => AppConfig.configApp().then((_) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //TODO config navigator

  @override
  Widget build(context) {
    return MaterialApp(
      title: "Notion Finance App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
          textTheme: const TextTheme()),
      home: const InitialPage(),
    );
  }
}
