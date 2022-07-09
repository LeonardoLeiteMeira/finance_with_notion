import 'package:flutter/material.dart';
import 'package:finance_with_notion/pages/initial/inital.page.dart';
import 'package:finance_with_notion/shared/DI/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const InitialPage());
}
