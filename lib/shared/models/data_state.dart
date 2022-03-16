import 'package:flutter/cupertino.dart';
import 'package:leo_financial/shared/models/failure.dart';
import 'package:mobx/mobx.dart';
part 'data_state.g.dart';

enum StateType { INITIAL, SUCCESS, RELOADING, ERROR }

typedef Initial = Widget Function();
typedef Error = Widget Function(Failure? error);
typedef Success<T> = Widget Function(T? data);
typedef SuccessReloadable<T> = Widget Function(T? data, bool isLoading);

typedef LoadingResult = void Function(bool loading);
typedef SuccessResult<T> = void Function(T? data);
typedef ErrorResult = void Function(Failure? error);

class DataState<T> = _DataStateBase<T> with _$DataState;

abstract class _DataStateBase<T> with Store {
  _DataStateBase({StateType state = StateType.INITIAL}) : _state = state;

  @observable
  StateType _state;

  StateType get state => _state;

  T? _data;
  T? get data => _data;

  Failure? _error;
  Failure? get error => _error;

  @action
  void setInitial() {
    _state = StateType.INITIAL;
  }

  @action
  void setLoading() {
    _state = StateType.RELOADING;
  }

  @action
  void setData(T data) {
    _state = StateType.SUCCESS;
    _data = data;
  }

  @action
  void setError(Failure error) {
    _state = StateType.ERROR;
    _error = error;
  }

  Widget handleState(Initial initial, Success<T> success, [Error? error]) {
    switch (_state) {
      case StateType.INITIAL:
        return initial();
      case StateType.ERROR:
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
      case StateType.INITIAL:
        return initial();

      case StateType.ERROR:
        if (error == null) {
          return const SizedBox();
        } else {
          return error(_error);
        }

      default:
        return successReloadable(_data, _state == StateType.RELOADING);
    }
  }

  ReactionDisposer handleReactionState(
      {LoadingResult? loadingResult,
      SuccessResult<T>? successResult,
      ErrorResult? error}) {
    return reaction((_) => _state, (_) {
      switch (_state) {
        case StateType.RELOADING:
          if (loadingResult != null) loadingResult(true);
          break;
        case StateType.ERROR:
          if (loadingResult != null) loadingResult(false);
          if (error != null) error(_error);
          break;
        case StateType.SUCCESS:
          if (loadingResult != null) loadingResult(false);
          if (successResult != null) successResult(_data);
          break;

        case StateType.INITIAL:
          break;
      }
    });
  }
}
