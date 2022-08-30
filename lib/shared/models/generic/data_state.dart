import 'package:flutter/cupertino.dart';
import 'package:finance_with_notion/shared/models/generic/failure.dart';
import 'package:mobx/mobx.dart';
part 'data_state.g.dart';

enum StateType { initial, success, reloading, error }

typedef Initial = Widget Function();
typedef Error = Widget Function(Failure? error);
typedef Success<T> = Widget Function(T? data);
typedef SuccessReloadable<T> = Widget Function(T? data, bool isLoading);

typedef LoadingResult = void Function(bool loading);
typedef SuccessResult<T> = void Function(T? data);
typedef ErrorResult = void Function(Failure? error);

class DataState<T> = _DataStateBase<T> with _$DataState;

abstract class _DataStateBase<T> with Store {
  _DataStateBase({StateType state = StateType.initial}) : _state = state;

  @observable
  StateType _state;

  StateType get state => _state;

  T? _data;
  T? get data => _data;

  Failure? _error;
  Failure? get error => _error;

  @action
  void setInitial() {
    _state = StateType.initial;
  }

  @action
  void setLoading() {
    _state = StateType.reloading;
  }

  @action
  void setData(T data) {
    _state = StateType.success;
    _data = data;
  }

  @action
  void setError(Failure error) {
    _state = StateType.error;
    _error = error;
  }

  Widget handleState(
      {required Initial initial, required Success<T> success, Error? error}) {
    switch (_state) {
      case StateType.initial:
        return initial();
      case StateType.error:
        if (error == null) {
          return const SizedBox();
        } else {
          return error(_error);
        }
      default:
        return success(_data);
    }
  }

  Widget handleStateReloadable(
      Initial initial, SuccessReloadable<T> successReloadable,
      [Error? error]) {
    switch (_state) {
      case StateType.initial:
        return initial();

      case StateType.error:
        if (error == null) {
          return const SizedBox();
        } else {
          return error(_error);
        }

      default:
        return successReloadable(_data, _state == StateType.reloading);
    }
  }

  ReactionDisposer handleReactionState(
      {LoadingResult? loadingResult,
      SuccessResult<T>? successResult,
      ErrorResult? error}) {
    return reaction((_) => _state, (_) {
      switch (_state) {
        case StateType.reloading:
          if (loadingResult != null) loadingResult(true);
          break;
        case StateType.error:
          if (loadingResult != null) loadingResult(false);
          if (error != null) error(_error);
          break;
        case StateType.success:
          if (loadingResult != null) loadingResult(false);
          if (successResult != null) successResult(_data);
          break;

        case StateType.initial:
          break;
      }
    });
  }
}
