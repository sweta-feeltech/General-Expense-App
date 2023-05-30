class ExpenseCatFilterModel {
  String? id;
  String? expenseCategoryName;

  ExpenseCatFilterModel(this.id, this.expenseCategoryName);

  ExpenseCatFilterModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    expenseCategoryName = json["expenseCategoryName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = this.id;
    data["expenseCategoryName"] = this.expenseCategoryName;
    return data;
  }

  @override
  String toString() {
    return "{id: $id, name: $expenseCategoryName}";
  }
}