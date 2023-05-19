class GetGroupListModel {
  String? id;
  String? groupName;
  String? description;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetGroupListModel(
      {this.id,
        this.groupName,
        this.description,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetGroupListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupName'] = this.groupName;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
