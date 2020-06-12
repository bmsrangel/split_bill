import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_bloc.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/result/result_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router(
          "/result",
          module: ResultModule(),
          transition: TransitionType.rightToLeftWithFade,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
