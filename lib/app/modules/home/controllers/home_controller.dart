import 'package:asuka/asuka.dart';
import 'package:devbank_front/app/modules/home/controllers/home_state.dart';
import 'package:devbank_front/app/modules/home/models/money_request_model.dart';
import 'package:devbank_front/app/modules/home/models/money_response_model.dart';
import 'package:devbank_front/app/modules/home/repositories/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier implements Disposable {
  final HomeRepository _homeRepository = Modular.get<HomeRepository>();
  MoneyRequest moneyRequest = MoneyRequest();
  MoneyResponse moneyResponse = MoneyResponse();
  HomeState extractState = HomeStateStart();
  bool hideValue = false;

  void postIncrementMoney(moneyRequest) async {
    try {
      moneyResponse =
          await _homeRepository.postIncrementMoneyRoute(moneyRequest);
      getExtract();
    } catch (e) {
      AsukaSnackbar.warning("Valor não definido").show();
    }
  }

  void postDecrementMoney(moneyRequest) async {
    try {
      moneyResponse =
          await _homeRepository.postDecrementMoneyRoute(moneyRequest);
      getExtract();
    } catch (e) {
      AsukaSnackbar.warning("Valor não definido").show();
    }
  }

  void getExtract() async {
    try {
      extractState = HomeStateLoading();
      notifyListeners();
      final extractResponse = await _homeRepository.getExtract();
      extractState = HomeStateSuccess(extractResponse: extractResponse);
      notifyListeners();
    } catch (e) {
      AsukaSnackbar.warning("Dados inválidos").show();
      extractState = HomeStateFailed();
      notifyListeners();
    }
  }

  void getExtractWithType(type) async {
    try {
      extractState = HomeStateLoading();
      notifyListeners();
      final extractResponse = await _homeRepository.getExtractWithType(type);
      extractState = HomeStateSuccess(extractResponse: extractResponse);
      notifyListeners();
    } catch (e) {
      AsukaSnackbar.warning("Dados inválidos").show();
      extractState = HomeStateFailed();
      notifyListeners();
    }
  }

  void getExtractWithDate(initialDate, finalDate) async {
    try {
      extractState = HomeStateLoading();
      notifyListeners();
      final extractResponse =
          await _homeRepository.getExtractWithDate(initialDate, finalDate);
      extractState = HomeStateSuccess(extractResponse: extractResponse);
      notifyListeners();
    } catch (e) {
      AsukaSnackbar.warning("Dados inválidos").show();
      extractState = HomeStateFailed();
      notifyListeners();
    }
  }

  void getExtractWithDateAndType(initialDate, finalDate, type) async {
    try {
      extractState = HomeStateLoading();
      notifyListeners();
      final extractResponse = await _homeRepository.getExtractWithDateAndType(
          type, initialDate, finalDate);
      extractState = HomeStateSuccess(extractResponse: extractResponse);
      notifyListeners();
    } catch (e) {
      AsukaSnackbar.warning("Dados inválidos").show();
      extractState = HomeStateFailed();
      notifyListeners();
    }
  }
}
