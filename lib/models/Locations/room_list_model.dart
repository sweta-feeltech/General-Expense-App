class GetRoomListModel {
  String? id;
  String? roomLocationName;
  String? description;
  String? homeLocationId;

  GetRoomListModel(
      {this.id, this.roomLocationName, this.description, this.homeLocationId});

  GetRoomListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomLocationName = json['roomLocationName'];
    description = json['description'];
    homeLocationId = json['homeLocationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomLocationName'] = this.roomLocationName;
    data['description'] = this.description;
    data['homeLocationId'] = this.homeLocationId;
    return data;
  }
}
