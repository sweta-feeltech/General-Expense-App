class GetHomeListModel {
  String? id;
  String? homeLocationName;
  String? description;
  bool? status;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetHomeListModel(
      {this.id,
        this.homeLocationName,
        this.description,
        this.status,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetHomeListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeLocationName = json['homeLocationName'];
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
    data['homeLocationName'] = this.homeLocationName;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
