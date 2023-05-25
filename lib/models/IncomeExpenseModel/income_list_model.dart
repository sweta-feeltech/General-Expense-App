class IncomeListModel {
  String? id;
  String? memberId;
  bool? isGroupAdmin;
  String? incomeDate;
  dynamic amount;
  String? description;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  IncomeListModel(
      {this.id,
        this.memberId,
        this.isGroupAdmin,
        this.incomeDate,
        this.amount,
        this.description,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  IncomeListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    isGroupAdmin = json['isGroupAdmin'];
    incomeDate = json['incomeDate'];
    amount = json['amount'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['memberId'] = this.memberId;
    data['isGroupAdmin'] = this.isGroupAdmin;
    data['incomeDate'] = this.incomeDate;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

