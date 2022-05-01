import 'package:devbank_front/app/modules/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // static const ROUTE = '/bank';

  @override
  List<Bind> get binds => [
        // Bind.lazySingleton((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(LoginModule.ROUTE, module: LoginModule()),
      ];
}
