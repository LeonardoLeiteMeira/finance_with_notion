import 'package:flutter/material.dart';
import 'package:leo_financial/pages/initial/inital.page.dart';
import 'package:leo_financial/shared/DI/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const InitialPage());
}
