// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../pages/initial/initial.controller.dart' as _i5;
import '../../pages/registerTransaction/register_transaction.controller.dart'
    as _i3;
import '../../usecase/user_transactions.usecase.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.RegisterTransactionController>(
      () => _i3.RegisterTransactionController());
  gh.factory<_i4.UserTransactionUsecase>(() => _i4.UserTransactionUsecase());
  gh.lazySingleton<_i5.InitialController>(
      () => _i5.InitialController(get<_i4.UserTransactionUsecase>()));
  return get;
}
