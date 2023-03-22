// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/dataInsights/dataInsights.controller.dart' as _i3;
import '../../features/expenses/expenses.controller.dart' as _i4;
import '../../features/expenses/listTransaction/list_transaction.controller.dart'
    as _i14;
import '../../features/expenses/registerTransaction/register_transaction.controller.dart'
    as _i16;
import '../../features/expenses/registerTransaction/widgets/account_card/account_card_controller.dart'
    as _i13;
import '../../features/expenses/registerTransaction/widgets/select_category/select_category_controller.dart'
    as _i17;
import '../../repository/transaction/notion_impl/notion_database.dart' as _i11;
import '../../repository/transaction/transaction_database.dart' as _i10;
import '../../usecase/location_usecase.dart' as _i8;
import '../../usecase/user_transactions.usecase.dart' as _i12;
import '../config/shared_prefs.dart' as _i9;
import '../httpRequest/http_request.dart' as _i5;
import '../httpRequest/implementation/dio_impl.dart' as _i6;
import '../service/location_service/location_service.dart' as _i7;
import '../widgets/forms_widget/location_component/location_component_controller.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.DataInsightsController>(
      () => _i3.DataInsightsController());
  gh.lazySingleton<_i4.ExpensesController>(() => _i4.ExpensesController());
  gh.factory<_i5.HttpRequest>(() => _i6.DioImpl());
  gh.factory<_i7.LocationService>(() => _i7.LocationService());
  gh.lazySingleton<_i8.LocationUseCase>(
      () => _i8.LocationUseCase(get<_i7.LocationService>()));
  gh.singletonAsync<_i9.SharedPrefs>(() => _i9.SharedPrefs.create());
  gh.lazySingleton<_i10.TransactionDatabase>(() => _i11.NotionDatabase(
        get<_i5.HttpRequest>(),
        sharedPrefsToUnitTest: get<_i9.SharedPrefs>(),
      ));
  gh.factory<_i12.UserTransactionUsecase>(
      () => _i12.UserTransactionUsecase(get<_i10.TransactionDatabase>()));
  gh.factory<_i13.AccountCardController>(
      () => _i13.AccountCardController(get<_i12.UserTransactionUsecase>()));
  gh.lazySingleton<_i14.ListTransactionController>(
      () => _i14.ListTransactionController(get<_i12.UserTransactionUsecase>()));
  gh.factory<_i15.LocationComponentController>(
      () => _i15.LocationComponentController(get<_i8.LocationUseCase>()));
  gh.lazySingleton<_i16.RegisterTransactionController>(
      () => _i16.RegisterTransactionController(
            get<_i8.LocationUseCase>(),
            get<_i12.UserTransactionUsecase>(),
          ));
  gh.factory<_i17.SelectCategoryController>(
      () => _i17.SelectCategoryController(get<_i12.UserTransactionUsecase>()));
  return get;
}
