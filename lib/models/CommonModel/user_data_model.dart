class UserData2 {
  String? email;
  String? userName;
  String? profilePic;

  UserData2({this.email, this.userName, this.profilePic});

  UserData2.fromJson(Map<String, dynamic> json) {
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