import 'package:devbank_front/app/modules/register/controllers/register_controller.dart';
import 'package:devbank_front/app/modules/register/register_page.dart';
import 'package:devbank_front/app/modules/register/repositories/register_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
        Bind((i) => RegisterRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const RegisterPage()),
      ];
}
