class RegistrationDataModel {
  String? message;
  String? accessToken;
  UserData? userData;

  RegistrationDataModel({this.message, this.accessToken, this.userData});

  RegistrationDataModel.fromJson(Map<String, dynamic> json) {
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

class UserData {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? birthDate;

  UserData(
      {this.email,
        this.id,
        this.firstName,
        this.lastName,
        this.profilePic,
        this.birthDate});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'];
    birthDate = json['birthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profilePic'] = this.profilePic;
    data['birthDate'] = this.birthDate;
    return data;
  }
}
