class GetProfileModel {
  String? id;
  String? profilePic;
  String? firstName;
  String? lastName;
  int? mobile;
  String? address;
  String? email;
  String? birthDate;
  String? bio;
  Null? isVerified;
  Null? verifiedAt;
  bool? status;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetProfileModel(
      {this.id,
        this.profilePic,
        this.firstName,
        this.lastName,
        this.mobile,
        this.address,
        this.email,
        this.birthDate,
        this.bio,
        this.isVerified,
        this.verifiedAt,
        this.status,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilePic = json['profilePic'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    address = json['address'];
    email = json['email'];
    birthDate = json['birthDate'];
    bio = json['bio'];
    isVerified = json['isVerified'];
    verifiedAt = json['verifiedAt'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profilePic'] = this.profilePic;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['bio'] = this.bio;
    data['isVerified'] = this.isVerified;
    data['verifiedAt'] = this.verifiedAt;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
