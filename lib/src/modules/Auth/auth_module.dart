import 'package:devbank_front/src/modules/Auth/auth_controller.dart';
import 'package:devbank_front/src/modules/Auth/auth_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  static const ROUTE = '/';

  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(ROUTE, child: (_, args) => const AuthPage()),
      ];
}