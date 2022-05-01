import 'package:devbank_front/app/modules/login/controllers/login_controller.dart';
import 'package:devbank_front/app/modules/login/login_page.dart';
import 'package:devbank_front/app/modules/login/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
        Bind((i) => LoginRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const LoginPage()),
      ];
}
