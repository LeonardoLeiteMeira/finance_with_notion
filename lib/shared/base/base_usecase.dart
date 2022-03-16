import 'package:flutter/widgets.dart';
import 'package:leo_financial/shared/models/generic/failure.dart';
import 'package:leo_financial/shared/models/generic/result.dart';

abstract class BaseUsecase {
  @protected
  Future<Result<T>> safeCall<T>(Future<T> Function() call) async {
    try {
      return Result.success(await call());
    } catch (e) {
      return Result.error(UnmappedFailure(e));
    }
  }

  @protected
  Result<T> safeCallSync<T>(T Function() call) {
    try {
      return Result.success(call());
    } catch (e) {
      return Result.error(UnmappedFailure(e));
    }
  }
}
