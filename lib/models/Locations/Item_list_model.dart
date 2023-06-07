class GetItemListModel {
  String? id;
  String? homeLocationId;
  String? homeLocationName;
  String? roomLocationId;
  String? roomLocationName;
  String? shelfLocationId;
  String? shelfLocationName;
  String? itemName;
  dynamic price;
  String? receipt;
  String? description;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GetItemListModel(
      {this.id,
        this.homeLocationId,
        this.homeLocationName,
        this.roomLocationId,
        this.roomLocationName,
        this.shelfLocationId,
        this.shelfLocationName,
        this.itemName,
        this.price,
        this.receipt,
        this.description,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GetItemListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeLocationId = json['homeLocationId'];
    homeLocationName = json['homeLocationName'];
    roomLocationId = json['roomLocationId'];
    roomLocationName = json['roomLocationName'];
    shelfLocationId = json['shelfLocationId'];
    shelfLocationName = json['shelfLocationName'];
    itemName = json['itemName'];
    price = json['price'];
    receipt = json['receipt'];
    description = json['description'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['homeLocationId'] = this.homeLocationId;
    data['homeLocationName'] = this.homeLocationName;
    data['roomLocationId'] = this.roomLocationId;
    data['roomLocationName'] = this.roomLocationName;
    data['shelfLocationId'] = this.shelfLocationId;
    data['shelfLocationName'] = this.shelfLocationName;
    data['itemName'] = this.itemName;
    data['price'] = this.price;
    data['receipt'] = this.receipt;
    data['description'] = this.description;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
