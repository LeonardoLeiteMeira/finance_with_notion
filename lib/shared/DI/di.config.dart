// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../pages/initial/initial.controller.dart' as _i10;
import '../../pages/registerTransaction/register_transaction.controller.dart'
    as _i5;
import '../../repository/transaction/notion_impl/notion_database.dart' as _i8;
import '../../repository/transaction/transaction_database.dart' as _i7;
import '../../usecase/user_transactions.usecase.dart' as _i9;
import '../config/shared_prefs.dart' as _i6;
import '../httpRequest/http_request.dart' as _i3;
import '../httpRequest/implementation/dio_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HttpRequest>(() => _i4.DioImpl());
  gh.lazySingleton<_i5.RegisterTransactionController>(
      () => _i5.RegisterTransactionController());
  gh.singleton<_i6.SharedPrefs>(_i6.SharedPrefs());
  gh.singleton<_i7.TransactionDatabase>(
      _i8.NotionDatabase(get<_i3.HttpRequest>(), get<_i6.SharedPrefs>()));
  gh.factory<_i9.UserTransactionUsecase>(() => _i9.UserTransactionUsecase());
  gh.lazySingleton<_i10.InitialController>(
      () => _i10.InitialController(get<_i9.UserTransactionUsecase>()));
  return get;
}
