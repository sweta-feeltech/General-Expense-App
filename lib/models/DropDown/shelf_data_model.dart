class GetShelfLocationModel {
  String? id;
  String? homeLocationId;
  String? homeLocationName;
  String? roomLocationId;
  String? roomLocationName;
  String? shelfLocationName;
  String? description;
  bool? status;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetShelfLocationModel(
      {this.id,
        this.homeLocationId,
        this.homeLocationName,
        this.roomLocationId,
        this.roomLocationName,
        this.shelfLocationName,
        this.description,
        this.status,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetShelfLocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeLocationId = json['homeLocationId'];
    homeLocationName = json['homeLocationName'];
    roomLocationId = json['roomLocationId'];
    roomLocationName = json['roomLocationName'];
    shelfLocationName = json['shelfLocationName'];
    description = json['description'];
    status = json['status'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['homeLocationId'] = this.homeLocationId;
    data['homeLocationName'] = this.homeLocationName;
    data['roomLocationId'] = this.roomLocationId;
    data['roomLocationName'] = this.roomLocationName;
    data['shelfLocationName'] = this.shelfLocationName;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
