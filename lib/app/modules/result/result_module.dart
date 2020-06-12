import 'package:flutter_modular/flutter_modular.dart';

import 'result_controller.dart';
import 'result_page.dart';
import 'widgets/individual_values/individual_values_store.dart';

class ResultModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IndividualValuesStore()),
        Bind((i) => ResultController(i.args.data)),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ResultPage()),
      ];

  static Inject get to => Inject<ResultModule>.of();
}
