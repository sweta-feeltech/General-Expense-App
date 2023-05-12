class UserData {
  String? email;
  String? userName;
  String? profilePic;

  UserData({this.email, this.userName, this.profilePic});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['profilePic'] = this.profilePic;
    return data;
  }
}