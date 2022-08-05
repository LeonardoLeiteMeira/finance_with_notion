import 'package:finance_with_notion/shared/config/shared_pref_handler.dart';
import 'package:injectable/injectable.dart';

@singleton
class SharedPrefs extends SharedPrefHandler {
  @factoryMethod
  Future<SharedPrefs> create() async {
    var prefs = SharedPrefs();
    await prefs.init();
    return prefs;
  }

  final String _notionDatabaseIdKey = "notionDatabaseId";
  String get notionDatabaseId => getString(_notionDatabaseIdKey) ?? "";
  set notionDatabaseId(String notionDatabaseId) =>
      saveString(_notionDatabaseIdKey, notionDatabaseId);

  final String _notionSecretTokenKey = "notionToken";
  String get notionSecretToken => getString(_notionSecretTokenKey) ?? "";
  set notionSecretToken(String notionDatabaseId) =>
      saveString(_notionSecretTokenKey, notionDatabaseId);
}
