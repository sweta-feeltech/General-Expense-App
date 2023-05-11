class UserData {
  String? email;
  String? userName;
  String? roleName;

  UserData({this.email, this.userName, this.roleName});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['roleName'] = this.roleName;
    return data;
  }
}