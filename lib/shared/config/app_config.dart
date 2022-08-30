import 'package:finance_with_notion/shared/DI/di.dart';
import 'package:finance_with_notion/shared/config/shared_prefs.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class AppConfig {
  static Future<void> configApp() async {
    await dotenv.load(fileName: ".env");
    configureDependencies();
    WidgetsFlutterBinding.ensureInitialized();

    GetIt getIt = GetIt.instance;
    await getIt.allReady();
    var preferences = getIt.get<SharedPrefs>();
    preferences.notionDatabaseId =
        dotenv.env["NOTION_DATABASE_ID"] ?? "databaseId";
    preferences.notionSecretToken =
        dotenv.env["NOTION_SECRET_TOKEN"] ?? "secretToken";
  }
}
