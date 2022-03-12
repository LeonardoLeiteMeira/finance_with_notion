import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

abstract class BaseStateWithController<W extends StatefulWidget,
    C extends Object> extends BaseState<W> {
  @protected
  C controller = GetIt.I.get<C>();

  @override
  void dispose() {
    super.dispose();
    GetIt.I.resetLazySingleton(instance: controller);
    print("Dispose $C");
  }
}

abstract class BaseState<W extends StatefulWidget> extends State<W> {
  List<ReactionDisposer>? reactionDisposers;

  @protected
  Widget showLoading() {
    return const CircularProgressIndicator();
  }

  @override
  void dispose() {
    reactionDisposers?.forEach((dispose) {
      dispose();
    });
    super.dispose();
  }
}
