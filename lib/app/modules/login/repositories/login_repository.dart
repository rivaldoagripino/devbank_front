import 'package:devbank_front/app/modules/login/models/login_response_model.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  Dio dio = Dio();

  Future<LoginModelResponse> postLoginRoute(loginModelRequest) async {
    String route = "http://10.0.2.2:8000/api/token/";
    late Response response;

    try {
      response = await dio.post(route, data: loginModelRequest);
      LoginModelResponse loginModelResponse;
      if (response.statusCode == 200) {
        loginModelResponse = LoginModelResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return loginModelResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }
}
