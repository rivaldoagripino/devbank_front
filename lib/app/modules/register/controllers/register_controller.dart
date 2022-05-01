import 'package:asuka/asuka.dart';
import 'package:devbank_front/app/modules/register/models/register_request_model.dart';
import 'package:devbank_front/app/modules/register/models/register_response_model.dart';
import 'package:devbank_front/app/modules/register/repositories/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterController extends ChangeNotifier implements Disposable {
  final RegisterRepository _registerRepository =
      Modular.get<RegisterRepository>();
  RegisterModelRequest registerModelRequest = RegisterModelRequest();
  RegisterModelResponse registerModelResponse = RegisterModelResponse();

  void signup(registerModelRequest) async {
    try {
      registerModelResponse =
          await _registerRepository.postRegisterRoute(registerModelRequest);
      AsukaSnackbar.success("Usuário cadastrado com sucesso").show();
    } catch (e) {
      AsukaSnackbar.warning("Dados inválidos").show();
    }
  }
}
