class HorizontalSearchListModel {
  String? id;
  String? title;
  String? desc;
  String? boxtype;

  HorizontalSearchListModel({required this.id, required this.title, required this.desc,this.boxtype});

  HorizontalSearchListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json["title"];
    desc = json["desc"];
    boxtype = json["boxtype"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["desc"] = this.desc;
    data["boxtype"] = this.boxtype;
    return data;
  }
}