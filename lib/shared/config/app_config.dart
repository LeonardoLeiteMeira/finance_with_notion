import 'package:finance_with_notion/shared/DI/di.dart';
import 'package:finance_with_notion/shared/config/shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class AppConfig {
  static Future<void> configApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    GetIt getIt = GetIt.instance;
    await getIt.allReady();

    var preferences = getIt.get<SharedPrefs>();
    preferences.notionDatabaseId = "database";
    preferences.notionSecretToken = "secret";
  }
}
