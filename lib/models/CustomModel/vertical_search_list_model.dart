class VerticalSearchListModel {
  String? id;
  String? title;
  String? date;
  String? amount;
  String? transctionType;
  String? itemtype;

  VerticalSearchListModel({required this.id, required this.title, required this.date, this.amount, this.transctionType,this.itemtype});

  VerticalSearchListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json["title"];
    date = json["date"];
    amount = json["amount"];
    transctionType = json["transctionType"];
    itemtype = json["itemtype"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["date"] = this.date;
    data["amount"] = this.amount;
    data["transctionType"] = this.transctionType;
    data["itemtype"] = this.itemtype;
     return data;
  }
}