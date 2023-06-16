class UserData {
  String? email;
  String? id;
  String? firstName;
  String? lastName;
  String? profilePic;
  String? birthDate;
  String? bio;

  UserData(
      {this.email,
        this.id,
        this.firstName,
        this.lastName,
        this.profilePic,
        this.birthDate,
        this.bio});

  UserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profilePic = json['profilePic'];
    birthDate = json['birthDate'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profilePic'] = this.profilePic;
    data['birthDate'] = this.birthDate;
    data['bio'] = this.bio;
    return data;
  }
}
