import 'package:finance_with_notion/shared/models/generic/failure.dart';
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
    GetIt.I.resetLazySingleton<C>(instance: controller);
    print("Dispose $C");
  }
}

abstract class BaseState<W extends StatefulWidget> extends State<W> {
  List<ReactionDisposer>? reactionDisposers;

  @protected
  Widget showLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  @protected
  Widget errorWidget(Failure? e) {
    print("Error:\n $e");
    return const Center(
      child: Text("Error to load information"),
    );
  }

  @override
  void dispose() {
    reactionDisposers?.forEach((dispose) {
      dispose();
    });
    super.dispose();
  }
}
