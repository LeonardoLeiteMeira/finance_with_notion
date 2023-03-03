// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/expenses/expenses.controller.dart' as _i3;
import '../../features/expenses/listTransaction/list_transaction.controller.dart'
    as _i13;
import '../../features/expenses/registerTransaction/register_transaction.controller.dart'
    as _i15;
import '../../features/expenses/registerTransaction/widgets/account_card/account_card_controller.dart'
    as _i12;
import '../../features/expenses/registerTransaction/widgets/select_category/select_category_controller.dart'
    as _i16;
import '../../repository/transaction/notion_impl/notion_database.dart' as _i10;
import '../../repository/transaction/transaction_database.dart' as _i9;
import '../../usecase/location_usecase.dart' as _i7;
import '../../usecase/user_transactions.usecase.dart' as _i11;
import '../config/shared_prefs.dart' as _i8;
import '../httpRequest/http_request.dart' as _i4;
import '../httpRequest/implementation/dio_impl.dart' as _i5;
import '../service/location_service/location_service.dart' as _i6;
import '../widgets/forms_widget/location_component/location_component_controller.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ExpensesController>(() => _i3.ExpensesController());
  gh.factory<_i4.HttpRequest>(() => _i5.DioImpl());
  gh.factory<_i6.LocationService>(() => _i6.LocationService());
  gh.lazySingleton<_i7.LocationUseCase>(
      () => _i7.LocationUseCase(get<_i6.LocationService>()));
  gh.singletonAsync<_i8.SharedPrefs>(() => _i8.SharedPrefs.create());
  gh.lazySingleton<_i9.TransactionDatabase>(() => _i10.NotionDatabase(
        get<_i4.HttpRequest>(),
        sharedPrefsToUnitTest: get<_i8.SharedPrefs>(),
      ));
  gh.factory<_i11.UserTransactionUsecase>(
      () => _i11.UserTransactionUsecase(get<_i9.TransactionDatabase>()));
  gh.factory<_i12.AccountCardController>(
      () => _i12.AccountCardController(get<_i11.UserTransactionUsecase>()));
  gh.lazySingleton<_i13.ListTransactionController>(
      () => _i13.ListTransactionController(get<_i11.UserTransactionUsecase>()));
  gh.factory<_i14.LocationComponentController>(
      () => _i14.LocationComponentController(get<_i7.LocationUseCase>()));
  gh.lazySingleton<_i15.RegisterTransactionController>(
      () => _i15.RegisterTransactionController(
            get<_i7.LocationUseCase>(),
            get<_i11.UserTransactionUsecase>(),
          ));
  gh.factory<_i16.SelectCategoryController>(
      () => _i16.SelectCategoryController(get<_i11.UserTransactionUsecase>()));
  return get;
}
