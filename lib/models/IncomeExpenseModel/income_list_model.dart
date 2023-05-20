class IncomeListModel {
  String? id;
  String? incomeDate;
  int? incomeCategory;
  int? amount;
  String? description;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  IncomeListModel(
      {this.id,
        this.incomeDate,
        this.incomeCategory,
        this.amount,
        this.description,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  IncomeListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    incomeDate = json['incomeDate'];
    incomeCategory = json['incomeCategory'];
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
    data['incomeDate'] = this.incomeDate;
    data['incomeCategory'] = this.incomeCategory;
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}


