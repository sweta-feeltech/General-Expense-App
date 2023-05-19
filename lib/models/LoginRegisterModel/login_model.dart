import '../CommonModel/user_data_model.dart';

class LoginModel {
  String? message;
  String? accessToken;
  UserData? userData;

  LoginModel({this.message, this.accessToken, this.userData});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['accessToken'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

