import 'package:devbank_front/app/app_module.dart';
import 'package:devbank_front/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  initialize();
}

void initialize() {
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
