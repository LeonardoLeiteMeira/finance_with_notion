import 'package:leo_financial/shared/models/generic/failure.dart';

import 'data_state.dart';

typedef Success<R, T> = R Function(T data);
typedef Error<R> = R Function(dynamic error);

class Result<T> {
  Result._();

  factory Result.success(T data) = SuccessResult<T>;
  factory Result.error(Failure error) = FailureResult;

  bool get isSuccess => this is SuccessResult<T>;
  bool get isError => this is FailureResult<T>;

  T? get data => this is SuccessResult ? (this as SuccessResult).value : null;
  dynamic get error =>
      this is FailureResult ? (this as FailureResult).err : null;

  ///Return success with data when success, and return error with FailureResult.error when error
  R result<R>(Success<R, T> success, Error<R> error) {
    if (isSuccess) {
      return success((this as SuccessResult).data);
    } else {
      return error((this as FailureResult).error);
    }
  }
}

class SuccessResult<T> extends Result<T> {
  SuccessResult(this.value) : super._();

  final T value;
}

class FailureResult<T> extends Result<T> {
  FailureResult(this.err) : super._();

  final Failure err;
}

extension FutureExtension<T> on Future<Result<T>> {
  Future<R> resultComplete<R>(
      R Function(T? data) success, R Function(Failure error) error) async {
    var res = await this;
    if (res.isSuccess) {
      return success((res as SuccessResult<T>).value);
    } else {
      return error((res as FailureResult).error);
    }
  }

  Future resultCompleteSet(DataState<T> dataState) async {
    var res = await this;
    if (res.isSuccess) {
      dataState.setData((res as SuccessResult<T>).value);
    } else {
      dataState.setError((res as FailureResult).err);
    }
  }
}
