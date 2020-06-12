import 'package:flutter_modular/flutter_modular.dart';

import 'result_bloc.dart';
import 'result_page.dart';
import 'widgets/individual_values/individual_values_bloc.dart';

class ResultModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IndividualValuesBloc()),
        Bind((i) => ResultBloc(i.args.data)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ResultPage()),
      ];

  static Inject get to => Inject<ResultModule>.of();
}
