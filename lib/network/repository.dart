import 'package:general_expense_app/network/api_client.dart';
import 'package:http/http.dart' as http;

import '../Utils/api_end_points.dart';
import '../models/LoginRegisterModel/login_model.dart';
import 'custom_exception.dart';


class Repository {
  final ApiClient apiClient;

  Repository(this.apiClient);

  static Repository getInstance () {
    return Repository(ApiClient(httpClient: http.Client()));
  }


  Future<LoginModel> loginPostAPI(String apiEndPoint, dynamic body) async {
    try {
      Map<String, dynamic> json = await apiClient.postApiCall(BASEURL, apiEndPoint, body);
      print("final received json = $json");
      LoginModel loginResponse = LoginModel.fromJson(json);
      return loginResponse;
    } on CustomException {
      rethrow;
    }
  }
}