import 'package:flutter/widgets.dart';
import 'package:finance_with_notion/shared/models/generic/failure.dart';
import 'package:finance_with_notion/shared/models/generic/result.dart';

abstract class BaseUsecase {
  @protected
  Future<Result<T>> safeCall<T>(Future<T> Function() call) async {
    try {
      return Result.success(await call());
    } catch (e) {
      return Result.error(Failure(e));
    }
  }

  @protected
  Result<T> safeCallSync<T>(T Function() call) {
    try {
      return Result.success(call());
    } catch (e) {
      return Result.error(Failure(e));
    }
  }
}
