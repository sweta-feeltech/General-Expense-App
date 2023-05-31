class GetExpenseCatModel {
  String? id;
  String? expenseCategoryName;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetExpenseCatModel(
      {this.id,
        this.expenseCategoryName,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetExpenseCatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseCategoryName = json['expenseCategoryName'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expenseCategoryName'] = this.expenseCategoryName;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

