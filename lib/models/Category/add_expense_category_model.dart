class AddExpenseCatModel {
  String? message;
  Data? data;

  AddExpenseCatModel({this.message, this.data});

  AddExpenseCatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? expenseCategoryName;
  bool? isDeleted;
  String? createdBy;
  String? createdByUser;
  String? createdDate;
  String? updatedBy;
  String? updatedByUser;
  String? updatedDate;
  String? deletedBy;
  String? deletedByUser;
  String? deletedDate;
  String? expenseExpenseCategoryId;

  Data(
      {this.id,
        this.expenseCategoryName,
        this.isDeleted,
        this.createdBy,
        this.createdByUser,
        this.createdDate,
        this.updatedBy,
        this.updatedByUser,
        this.updatedDate,
        this.deletedBy,
        this.deletedByUser,
        this.deletedDate,
        this.expenseExpenseCategoryId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseCategoryName = json['expenseCategoryName'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'];
    createdByUser = json['createdByUser'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedByUser = json['updatedByUser'];
    updatedDate = json['updatedDate'];
    deletedBy = json['deletedBy'];
    deletedByUser = json['deletedByUser'];
    deletedDate = json['deletedDate'];
    expenseExpenseCategoryId = json['expenseExpenseCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expenseCategoryName'] = this.expenseCategoryName;
    data['isDeleted'] = this.isDeleted;
    data['createdBy'] = this.createdBy;
    data['createdByUser'] = this.createdByUser;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedByUser'] = this.updatedByUser;
    data['updatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['deletedByUser'] = this.deletedByUser;
    data['deletedDate'] = this.deletedDate;
    data['expenseExpenseCategoryId'] = this.expenseExpenseCategoryId;
    return data;
  }
}