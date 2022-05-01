import 'package:asuka/asuka.dart' as asuka;
import 'package:devbank_front/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'DevBank',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 36, 142, 228),
          primaryColorLight: const Color(0xFFDFE6E5),
          primaryColorDark: const Color.fromARGB(255, 3, 54, 45),
        ),
        builder: asuka.builder,
        navigatorObservers: [asuka.asukaHeroController],
        initialRoute: LoginModule.ROUTE,
      ).modular();
    });
  }
}
