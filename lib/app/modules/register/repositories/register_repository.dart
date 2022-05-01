import 'package:devbank_front/app/modules/register/models/register_response_model.dart';
import 'package:dio/dio.dart';

class RegisterRepository {
  Dio dio = Dio();

  Future<RegisterModelResponse> postRegisterRoute(registerModelRequest) async {
    String route = "http://10.0.2.2:8000/api/register/";
    late Response response;

    try {
      response = await dio.post(route, data: registerModelRequest);
      RegisterModelResponse registerModelResponse;
      if (response.statusCode == 200) {
        registerModelResponse = RegisterModelResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return registerModelResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }
}
