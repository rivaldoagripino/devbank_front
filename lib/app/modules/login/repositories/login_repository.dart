import 'package:devbank_front/app/modules/login/models/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  Dio dio = Dio();

  Future<LoginModelResponse> postLoginRoute(loginModelRequest) async {
    String route = "http://10.0.2.2:8000/api/token/";

    try {
      final response = await dio.post(route, data: loginModelRequest);
      late final LoginModelResponse loginModelResponse;
      if (response.statusCode == 200) {
        loginModelResponse = LoginModelResponse.fromJson(response.data);
        final preference = await SharedPreferences.getInstance();
        await preference.setString("token", loginModelResponse.access!);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return loginModelResponse;
    } catch (e) {
      rethrow;
    }
  }
}
