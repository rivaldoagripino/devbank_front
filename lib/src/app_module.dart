import 'package:devbank_front/src/app_controller.dart';
import 'package:devbank_front/src/modules/Auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  // static const ROUTE = '/bank';

  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AuthModule.ROUTE, module: AuthModule()),
      ];
}
