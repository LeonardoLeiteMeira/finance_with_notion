import 'package:flutter/material.dart';
import 'package:finance_with_notion/pages/initial/inital.page.dart';
import 'package:finance_with_notion/shared/DI/di.dart';
import 'package:get_it/get_it.dart';

import 'shared/config/shared_prefs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  GetIt getIt = GetIt.instance;
  getIt.allReady().then((_) {
    var preferences = getIt.get<SharedPrefs>();
    preferences.notionDatabaseId = "database";
    preferences.notionSecretToken = "secret";
  });
  runApp(const InitialPage());
}
