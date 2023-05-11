class GetProfileModel {
  String? firstName;
  String? lastName;
  int? mobile;
  String? address;
  String? email;
  String? isVerified;
  String? verifiedAt;
  bool? status;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetProfileModel(
      {this.firstName,
        this.lastName,
        this.mobile,
        this.address,
        this.email,
        this.isVerified,
        this.verifiedAt,
        this.status,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    address = json['address'];
    email = json['email'];
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
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['email'] = this.email;
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