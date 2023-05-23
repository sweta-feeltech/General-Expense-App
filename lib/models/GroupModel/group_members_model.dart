class GroupMembersModel {
  String? id;
  String? groupId;
  String? groupPin;
  String? groupName;
  String? memberName;
  bool? isGroupAdmin;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  GroupMembersModel(
      {this.id,
        this.groupId,
        this.groupPin,
        this.groupName,
        this.memberName,
        this.isGroupAdmin,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  GroupMembersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['groupId'];
    groupPin = json['groupPin'];
    groupName = json['groupName'];
    memberName = json['memberName'];
    isGroupAdmin = json['isGroupAdmin'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupId'] = this.groupId;
    data['groupPin'] = this.groupPin;
    data['groupName'] = this.groupName;
    data['memberName'] = this.memberName;
    data['isGroupAdmin'] = this.isGroupAdmin;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}




// class GroupMembersModel {
//   String? id;
//   String? groupId;
//   String? groupName;
//   String? memberName;
//   bool? isGroupAdmin;
//   String? createdBy;
//   String? createdDate;
//   String? updatedBy;
//   String? updatedDate;
//
//   GroupMembersModel(
//       {this.id,
//         this.groupId,
//         this.groupName,
//         this.memberName,
//         this.isGroupAdmin,
//         this.createdBy,
//         this.createdDate,
//         this.updatedBy,
//         this.updatedDate});
//
//   GroupMembersModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     groupId = json['groupId'];
//     groupName = json['groupName'];
//     memberName = json['memberName'];
//     isGroupAdmin = json['isGroupAdmin'];
//     createdBy = json['createdBy'];
//     createdDate = json['createdDate'];
//     updatedBy = json['updatedBy'];
//     updatedDate = json['updatedDate'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['groupId'] = this.groupId;
//     data['groupName'] = this.groupName;
//     data['memberName'] = this.memberName;
//     data['isGroupAdmin'] = this.isGroupAdmin;
//     data['createdBy'] = this.createdBy;
//     data['createdDate'] = this.createdDate;
//     data['updatedBy'] = this.updatedBy;
//     data['updatedDate'] = this.updatedDate;
//     return data;
//   }
// }