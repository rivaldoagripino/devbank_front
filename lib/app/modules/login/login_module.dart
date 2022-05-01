import 'package:devbank_front/app/modules/login/controllers/login_controller.dart';
import 'package:devbank_front/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static const ROUTE = '/';

  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(ROUTE, child: (_, args) => const LoginPage()),
      ];
}
