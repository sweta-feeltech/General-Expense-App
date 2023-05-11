import 'package:general_expense_app/network/api_client.dart';
import 'package:http/http.dart' as http;


class Repository {
  final ApiClient apiClient;

  Repository(this.apiClient);

  static Repository getInstance () {
    return Repository(ApiClient(httpClient: http.Client()));
  }



}