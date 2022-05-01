import 'package:asuka/asuka.dart';
import 'package:devbank_front/app/modules/login/models/login_request_model.dart';
import 'package:devbank_front/app/modules/login/models/login_response_model.dart';
import 'package:devbank_front/app/modules/login/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginController extends ChangeNotifier implements Disposable {
  final LoginRepository _loginRepository = Modular.get<LoginRepository>();
  LoginModelRequest loginModelRequest = LoginModelRequest();
  LoginModelResponse loginModelResponse = LoginModelResponse();

  void login(loginModelRequest) async {
    try {
      loginModelResponse =
          await _loginRepository.postLoginRoute(loginModelRequest);
      AsukaSnackbar.success("Login efetuado").show();
    } catch (e) {
      AsukaSnackbar.warning("Usuário não encontrado").show();
    }
  }
}
