import 'package:devbank_front/app/modules/home/controllers/home_controller.dart';
import 'package:devbank_front/app/modules/home/home_page.dart';
import 'package:devbank_front/app/modules/home/repositories/home_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomePage()),
      ];
}
