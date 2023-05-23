class GroupLinkModel {
  String? pin;

  GroupLinkModel({this.pin});

  GroupLinkModel.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pin'] = this.pin;
    return data;
  }
}
