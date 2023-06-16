// class EditProfileModel {
//   String? message;
//   UserData1? userData;
//
//   EditProfileModel({this.message, this.userData});
//
//   EditProfileModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     userData = json['userData'] != null
//         ? new UserData1.fromJson(json['userData'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     if (this.userData != null) {
//       data['userData'] = this.userData!.toJson();
//     }
//     return data;
//   }
// }
//
// class UserData1 {
//   String? email;
//   String? userName;
//   String? profilePic;
//   String? roleName;
//
//   UserData1({this.email, this.userName, this.profilePic, this.roleName});
//
//   UserData1.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     userName = json['userName'];
//     profilePic = json['profilePic'];
//     roleName = json['roleName'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['userName'] = this.userName;
//     data['profilePic'] = this.profilePic;
//     data['roleName'] = this.roleName;
//     return data;
//   }
// }


class EditProfileModel {
  String? message;
  UserData1? userData;

  EditProfileModel({this.message, this.userData});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userData = json['userData'] != null
        ? new UserData1.fromJson(json['userData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userData != null) {
      data['userData'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData1{
  String? firstName;
  String? lastName;
  String? birthDate;
  String? bio;
  String? profilePic;

  UserData1({this.firstName, this.lastName, this.birthDate, this.bio,this.profilePic});

  UserData1.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthDate = json['birthDate'];
    bio = json['bio'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthDate'] = this.birthDate;
    data['bio'] = this.bio;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
