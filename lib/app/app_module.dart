import 'package:devbank_front/app/modules/login/login_module.dart';
import 'package:devbank_front/app/modules/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.lazySingleton((i) => AppController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/register', module: RegisterModule()),
      ];
}
