import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/curso/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    $HttpClientApp,
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];

}