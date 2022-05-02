import 'package:devbank_front/app/modules/home/models/extract_response_model.dart';
import 'package:devbank_front/app/modules/home/models/money_response_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Dio dio = Dio();

  Future<MoneyResponse> postIncrementMoneyRoute(moneyRequest) async {
    String route = "http://10.0.2.2:8000/api/transactions/add/";
    late Response response;

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      response = await dio.post(route,
          data: moneyRequest,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      MoneyResponse moneyResponse;
      if (response.statusCode == 200) {
        moneyResponse = MoneyResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return moneyResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }

  Future<MoneyResponse> postDecrementMoneyRoute(moneyRequest) async {
    String route = "http://10.0.2.2:8000/api/transactions/remove/";
    late Response response;

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      response = await dio.post(route,
          data: moneyRequest,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      MoneyResponse moneyResponse;
      if (response.statusCode == 200) {
        moneyResponse = MoneyResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return moneyResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }

  Future<ExtractResponse> getExtract() async {
    String route = "http://10.0.2.2:8000/api/extract/";

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      final response = await dio.get(route,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      ExtractResponse extractResponse;
      if (response.statusCode == 200) {
        extractResponse = ExtractResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return extractResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<ExtractResponse> getExtractWithType(type) async {
    String route = "http://10.0.2.2:8000/api/extract/$type";

    late Response response;

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      response = await dio.get(route,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      ExtractResponse extractResponse;
      if (response.statusCode == 200) {
        extractResponse = ExtractResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return extractResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }

  Future<ExtractResponse> getExtractWithDate(initialDate, finalDate) async {
    String route = "http://10.0.2.2:8000/api/extract/$initialDate&$finalDate";

    late Response response;

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      response = await dio.get(route,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      ExtractResponse extractResponse;
      if (response.statusCode == 200) {
        extractResponse = ExtractResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return extractResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }

  Future<ExtractResponse> getExtractWithDateAndType(
      type, initialDate, finalDate) async {
    String route =
        "http://10.0.2.2:8000/api/extract/$initialDate&$finalDate/$type";

    late Response response;

    try {
      final preference = await SharedPreferences.getInstance();
      final token = preference.getString("token");
      response = await dio.get(route,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      ExtractResponse extractResponse;
      if (response.statusCode == 200) {
        extractResponse = ExtractResponse.fromJson(response.data);
      } else {
        throw Exception("Unexpected return: " + response.data);
      }

      return extractResponse;
    } catch (e) {
      throw DioError(
          error: "Parse error: $e", requestOptions: response.requestOptions);
    }
  }
}
