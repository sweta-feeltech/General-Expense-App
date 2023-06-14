class GetSerachModel {
  List<TblGroup>? tblGroup;
  List<TblHomeLocation>? tblHomeLocation;
  List<TblItem>? tblItem;
  List<TblGroupMember>? tblGroupMember;
  List<TblRoomLocation>? tblRoomLocation;
  List<TblTransaction>? tblTransaction;
  List<TblExpense>? tblExpense;
  List<TblIncome>? tblIncome;
  List<TblShelfLocation>? tblShelfLocation;

  GetSerachModel(
      {this.tblGroup,
      this.tblHomeLocation,
      this.tblItem,
      this.tblGroupMember,
      this.tblRoomLocation,
      this.tblTransaction,
      this.tblExpense,
      this.tblIncome,
      this.tblShelfLocation});

  GetSerachModel.fromJson(Map<String, dynamic> json) {
    if (json['TblGroup'] != null) {
      tblGroup = <TblGroup>[];
      json['TblGroup'].forEach((v) {
        tblGroup!.add(new TblGroup.fromJson(v));
      });
    }
    if (json['TblHomeLocation'] != null) {
      tblHomeLocation = <TblHomeLocation>[];
      json['TblHomeLocation'].forEach((v) {
        tblHomeLocation!.add(new TblHomeLocation.fromJson(v));
      });
    }
    if (json['TblItem'] != null) {
      tblItem = <TblItem>[];
      json['TblItem'].forEach((v) {
        tblItem!.add(new TblItem.fromJson(v));
      });
    }
    if (json['TblGroupMember'] != null) {
      tblGroupMember = <TblGroupMember>[];
      json['TblGroupMember'].forEach((v) {
        tblGroupMember!.add(new TblGroupMember.fromJson(v));
      });
    }
    if (json['TblRoomLocation'] != null) {
      tblRoomLocation = <TblRoomLocation>[];
      json['TblRoomLocation'].forEach((v) {
        tblRoomLocation!.add(new TblRoomLocation.fromJson(v));
      });
    }
    if (json['TblTransaction'] != null) {
      tblTransaction = <TblTransaction>[];
      json['TblTransaction'].forEach((v) {
        tblTransaction!.add(new TblTransaction.fromJson(v));
      });
    }
    if (json['TblExpense'] != null) {
      tblExpense = <TblExpense>[];
      json['TblExpense'].forEach((v) {
        tblExpense!.add(new TblExpense.fromJson(v));
      });
    }
    if (json['TblIncome'] != null) {
      tblIncome = <TblIncome>[];
      json['TblIncome'].forEach((v) {
        tblIncome!.add(new TblIncome.fromJson(v));
      });
    }
    if (json['TblShelfLocation'] != null) {
      tblShelfLocation = <TblShelfLocation>[];
      json['TblShelfLocation'].forEach((v) {
        tblShelfLocation!.add(new TblShelfLocation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tblGroup != null) {
      data['TblGroup'] = this.tblGroup!.map((v) => v.toJson()).toList();
    }
    if (this.tblHomeLocation != null) {
      data['TblHomeLocation'] =
          this.tblHomeLocation!.map((v) => v.toJson()).toList();
    }
    if (this.tblItem != null) {
      data['TblItem'] = this.tblItem!.map((v) => v.toJson()).toList();
    }
    if (this.tblGroupMember != null) {
      data['TblGroupMember'] =
          this.tblGroupMember!.map((v) => v.toJson()).toList();
    }
    if (this.tblRoomLocation != null) {
      data['TblRoomLocation'] =
          this.tblRoomLocation!.map((v) => v.toJson()).toList();
    }
    if (this.tblTransaction != null) {
      data['TblTransaction'] =
          this.tblTransaction!.map((v) => v.toJson()).toList();
    }
    if (this.tblExpense != null) {
      data['TblExpense'] = this.tblExpense!.map((v) => v.toJson()).toList();
    }
    if (this.tblIncome != null) {
      data['TblIncome'] = this.tblIncome!.map((v) => v.toJson()).toList();
    }
    if (this.tblShelfLocation != null) {
      data['TblShelfLocation'] =
          this.tblShelfLocation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TblGroup {
  String? id;
  String? groupName;
  String? description;
  String? groupPin;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;

  TblGroup(
      {this.id,
      this.groupName,
      this.description,
      this.groupPin,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate});

  TblGroup.fromJson(Map<String, dynamic> json) {
    print("sdklkfhsdf sdkljfh k${json["UpdatedBy"]}k");
    id = json['Id'];
    groupName = json['GroupName'];
    description = json['Description'];
    groupPin = json['groupPin'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['GroupName'] = this.groupName;
    data['Description'] = this.description;
    data['groupPin'] = this.groupPin;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    return data;
  }
}

// class UpdatedBy {
//
//
//   UpdatedBy({});
//
// UpdatedBy.fromJson(Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }

class TblHomeLocation {
  String? id;
  String? homeLocationName;
  String? description;
  bool? status;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;
  String? memberId;

  TblHomeLocation(
      {this.id,
      this.homeLocationName,
      this.description,
      this.status,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.memberId});

  TblHomeLocation.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    homeLocationName = json['HomeLocationName'];
    description = json['Description'];
    status = json['Status'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['HomeLocationName'] = this.homeLocationName;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['MemberId'] = this.memberId;
    return data;
  }
}

class TblItem {
  String? id;
  String? homeLocationId;
  String? roomLocationId;
  String? shelfLocationId;
  String? itemName;
  dynamic price;
  String? receipt;
  String? description;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;
  String? memberId;

  TblItem(
      {this.id,
      this.homeLocationId,
      this.roomLocationId,
      this.shelfLocationId,
      this.itemName,
      this.price,
      this.receipt,
      this.description,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.memberId});

  TblItem.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    homeLocationId = json['HomeLocationId'];
    roomLocationId = json['RoomLocationId'];
    shelfLocationId = json['ShelfLocationId'];
    itemName = json['ItemName'];
    price = json['Price'];
    receipt = json['Receipt'];
    description = json['Description'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['HomeLocationId'] = this.homeLocationId;
    data['RoomLocationId'] = this.roomLocationId;
    data['ShelfLocationId'] = this.shelfLocationId;
    data['ItemName'] = this.itemName;
    data['Price'] = this.price;
    data['Receipt'] = this.receipt;
    data['Description'] = this.description;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['MemberId'] = this.memberId;
    return data;
  }
}

class TblGroupMember {
  String? id;
  String? groupId;
  String? memberId;
  bool? isGroupAdmin;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;

  TblGroupMember(
      {this.id,
      this.groupId,
      this.memberId,
      this.isGroupAdmin,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate});

  TblGroupMember.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    groupId = json['GroupId'];
    memberId = json['MemberId'];
    isGroupAdmin = json['IsGroupAdmin'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['GroupId'] = this.groupId;
    data['MemberId'] = this.memberId;
    data['IsGroupAdmin'] = this.isGroupAdmin;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    return data;
  }
}

class TblRoomLocation {
  String? id;
  String? homeLocationId;
  String? roomLocationName;
  String? description;
  bool? status;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;
  String? memberId;

  TblRoomLocation(
      {this.id,
      this.homeLocationId,
      this.roomLocationName,
      this.description,
      this.status,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.memberId});

  TblRoomLocation.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    homeLocationId = json['HomeLocationId'];
    roomLocationName = json['RoomLocationName'];
    description = json['Description'];
    status = json['Status'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['HomeLocationId'] = this.homeLocationId;
    data['RoomLocationName'] = this.roomLocationName;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['MemberId'] = this.memberId;
    return data;
  }
}

class TblTransaction {
  String? id;
  String? incomeId;
  String? expenseId;
  int? transactionType;
  String? createdDate;
  String? createdBy;
  dynamic amount;
  String? date;
  String? description;
  String? memberId;

  TblTransaction(
      {this.id,
      this.incomeId,
      this.expenseId,
      this.transactionType,
      this.createdDate,
      this.createdBy,
      this.amount,
      this.date,
      this.description,
      this.memberId});

  TblTransaction.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    incomeId = json['IncomeId'];
    expenseId = json['ExpenseId'];
    transactionType = json['TransactionType'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    amount = json['Amount'];
    date = json['Date'];
    description = json['Description'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IncomeId'] = this.incomeId;
    data['ExpenseId'] = this.expenseId;
    data['TransactionType'] = this.transactionType;
    data['CreatedDate'] = this.createdDate;
    data['CreatedBy'] = this.createdBy;
    data['Amount'] = this.amount;
    data['Date'] = this.date;
    data['Description'] = this.description;
    data['MemberId'] = this.memberId;
    return data;
  }
}

class TblExpense {
  String? id;
  String? expenseCategoryId;
  dynamic amount;
  String? receipt;
  String? toPay;
  String? remarks;
  String? memberId;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;
  String? expenseDate;

  TblExpense(
      {this.id,
      this.expenseCategoryId,
      this.amount,
      this.receipt,
      this.toPay,
      this.remarks,
      this.memberId,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.expenseDate});

  TblExpense.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    expenseCategoryId = json['ExpenseCategoryId'];
    amount = json['Amount'];
    receipt = json['Receipt'];
    toPay = json['ToPay'];
    remarks = json['Remarks'];
    memberId = json['MemberId'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    expenseDate = json['ExpenseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ExpenseCategoryId'] = this.expenseCategoryId;
    data['Amount'] = this.amount;
    data['Receipt'] = this.receipt;
    data['ToPay'] = this.toPay;
    data['Remarks'] = this.remarks;
    data['MemberId'] = this.memberId;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['ExpenseDate'] = this.expenseDate;
    return data;
  }
  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return "${amount},${id},${toPay},${remarks},${expenseDate}";
  // }
}


class TblIncome {
  String? id;
  String? memberId;
  String? incomeDate;
  dynamic amount;
  String? description;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;

  TblIncome(
      {this.id,
      this.memberId,
      this.incomeDate,
      this.amount,
      this.description,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate});

  TblIncome.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    memberId = json['MemberId'];
    incomeDate = json['IncomeDate'];
    amount = json['Amount'];
    description = json['Description'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['MemberId'] = this.memberId;
    data['IncomeDate'] = this.incomeDate;
    data['Amount'] = this.amount;
    data['Description'] = this.description;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    return data;
  }
}

class TblShelfLocation {
  String? id;
  String? roomLocationId;
  String? shelfLocationName;
  String? description;
  bool? status;
  bool? isDeleted;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? deletedBy;
  String? deletedDate;
  String? memberId;

  TblShelfLocation(
      {this.id,
      this.roomLocationId,
      this.shelfLocationName,
      this.description,
      this.status,
      this.isDeleted,
      this.createdBy,
      this.createdDate,
      this.updatedBy,
      this.updatedDate,
      this.deletedBy,
      this.deletedDate,
      this.memberId});

  TblShelfLocation.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    roomLocationId = json['RoomLocationId'];
    shelfLocationName = json['ShelfLocationName'];
    description = json['Description'];
    status = json['Status'];
    isDeleted = json['IsDeleted'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'];
    updatedDate = json['UpdatedDate'];
    deletedBy = json['DeletedBy'];
    deletedDate = json['DeletedDate'];
    memberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['RoomLocationId'] = this.roomLocationId;
    data['ShelfLocationName'] = this.shelfLocationName;
    data['Description'] = this.description;
    data['Status'] = this.status;
    data['IsDeleted'] = this.isDeleted;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedBy'] = this.updatedBy;
    data['UpdatedDate'] = this.updatedDate;
    data['deletedBy'] = this.deletedBy;
    data['DeletedDate'] = this.deletedDate;
    data['MemberId'] = this.memberId;
    return data;
  }
}

// class TblGroup {
// String? id;
// String? groupName;
// String? description;
// String? groupPin;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// String? updatedDate;
// UpdatedBy? deletedBy;
// String? deletedDate;
//
// TblGroup({this.id, this.groupName, this.description, this.groupPin, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate});
//
// TblGroup.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// groupName = json['GroupName'];
// description = json['Description'];
// groupPin = json['groupPin'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'];
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['GroupName'] = this.groupName;
// data['Description'] = this.description;
// data['groupPin'] = this.groupPin;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// data['UpdatedDate'] = this.updatedDate;
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// data['DeletedDate'] = this.deletedDate;
// return data;
// }
// }

// class TblHomeLocation {
// String? id;
// String? homeLocationName;
// String? description;
// bool? status;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// UpdatedBy? updatedDate;
// UpdatedBy? deletedBy;
// UpdatedBy? deletedDate;
// String? memberId;
//
// TblHomeLocation({this.id, this.homeLocationName, this.description, this.status, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate, this.memberId});
//
// TblHomeLocation.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// homeLocationName = json['HomeLocationName'];
// description = json['Description'];
// status = json['Status'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'] != null ? new UpdatedBy.fromJson(json['UpdatedDate']) : null;
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'] != null ? new UpdatedBy.fromJson(json['DeletedDate']) : null;
// memberId = json['MemberId'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['HomeLocationName'] = this.homeLocationName;
// data['Description'] = this.description;
// data['Status'] = this.status;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// if (this.updatedDate != null) {
// data['UpdatedDate'] = this.updatedDate!.toJson();
// }
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// if (this.deletedDate != null) {
// data['DeletedDate'] = this.deletedDate!.toJson();
// }
// data['MemberId'] = this.memberId;
// return data;
// }
// }

// class TblItem {
// String? id;
// UpdatedBy? homeLocationId;
// UpdatedBy? roomLocationId;
// String? shelfLocationId;
// String? itemName;
// int? price;
// String? receipt;
// String? description;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// UpdatedBy? updatedDate;
// UpdatedBy? deletedBy;
// UpdatedBy? deletedDate;
// String? memberId;
//
// TblItem({this.id, this.homeLocationId, this.roomLocationId, this.shelfLocationId, this.itemName, this.price, this.receipt, this.description, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate, this.memberId});
//
// TblItem.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// homeLocationId = json['HomeLocationId'] != null ? new UpdatedBy.fromJson(json['HomeLocationId']) : null;
// roomLocationId = json['RoomLocationId'] != null ? new UpdatedBy.fromJson(json['RoomLocationId']) : null;
// shelfLocationId = json['ShelfLocationId'];
// itemName = json['ItemName'];
// price = json['Price'];
// receipt = json['Receipt'];
// description = json['Description'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'] != null ? new UpdatedBy.fromJson(json['UpdatedDate']) : null;
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'] != null ? new UpdatedBy.fromJson(json['DeletedDate']) : null;
// memberId = json['MemberId'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// if (this.homeLocationId != null) {
// data['HomeLocationId'] = this.homeLocationId!.toJson();
// }
// if (this.roomLocationId != null) {
// data['RoomLocationId'] = this.roomLocationId!.toJson();
// }
// data['ShelfLocationId'] = this.shelfLocationId;
// data['ItemName'] = this.itemName;
// data['Price'] = this.price;
// data['Receipt'] = this.receipt;
// data['Description'] = this.description;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// if (this.updatedDate != null) {
// data['UpdatedDate'] = this.updatedDate!.toJson();
// }
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// if (this.deletedDate != null) {
// data['DeletedDate'] = this.deletedDate!.toJson();
// }
// data['MemberId'] = this.memberId;
// return data;
// }
// }

// class TblGroupMember {
// String? id;
// String? groupId;
// String? memberId;
// bool? isGroupAdmin;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// String? updatedDate;
// UpdatedBy? deletedBy;
// String? deletedDate;
//
// TblGroupMember({this.id, this.groupId, this.memberId, this.isGroupAdmin, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate});
//
// TblGroupMember.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// groupId = json['GroupId'];
// memberId = json['MemberId'];
// isGroupAdmin = json['IsGroupAdmin'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'];
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['GroupId'] = this.groupId;
// data['MemberId'] = this.memberId;
// data['IsGroupAdmin'] = this.isGroupAdmin;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// data['UpdatedDate'] = this.updatedDate;
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// data['DeletedDate'] = this.deletedDate;
// return data;
// }
// }

// class TblRoomLocation {
// String? id;
// String? homeLocationId;
// String? roomLocationName;
// String? description;
// bool? status;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// UpdatedBy? updatedDate;
// UpdatedBy? deletedBy;
// UpdatedBy? deletedDate;
// String? memberId;
//
// TblRoomLocation({this.id, this.homeLocationId, this.roomLocationName, this.description, this.status, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate, this.memberId});
//
// TblRoomLocation.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// homeLocationId = json['HomeLocationId'];
// roomLocationName = json['RoomLocationName'];
// description = json['Description'];
// status = json['Status'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'] != null ? new UpdatedBy.fromJson(json['UpdatedDate']) : null;
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'] != null ? new UpdatedBy.fromJson(json['DeletedDate']) : null;
// memberId = json['MemberId'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['HomeLocationId'] = this.homeLocationId;
// data['RoomLocationName'] = this.roomLocationName;
// data['Description'] = this.description;
// data['Status'] = this.status;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// if (this.updatedDate != null) {
// data['UpdatedDate'] = this.updatedDate!.toJson();
// }
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// if (this.deletedDate != null) {
// data['DeletedDate'] = this.deletedDate!.toJson();
// }
// data['MemberId'] = this.memberId;
// return data;
// }
// }

// class TblTransaction {
// String? id;
// String? incomeId;
// UpdatedBy? expenseId;
// int? transactionType;
// String? createdDate;
// String? createdBy;
// dynamic amount;
// String? date;
// String? description;
// String? memberId;
//
// TblTransaction({this.id, this.incomeId, this.expenseId, this.transactionType, this.createdDate, this.createdBy, this.amount, this.date, this.description, this.memberId});
//
// TblTransaction.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// incomeId = json['IncomeId'];
// expenseId = json['ExpenseId'] != null ? new UpdatedBy.fromJson(json['ExpenseId']) : null;
// transactionType = json['TransactionType'];
// createdDate = json['CreatedDate'];
// createdBy = json['CreatedBy'];
// amount = json['Amount'];
// date = json['Date'];
// description = json['Description'];
// memberId = json['MemberId'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['IncomeId'] = this.incomeId;
// if (this.expenseId != null) {
// data['ExpenseId'] = this.expenseId!.toJson();
// }
// data['TransactionType'] = this.transactionType;
// data['CreatedDate'] = this.createdDate;
// data['CreatedBy'] = this.createdBy;
// data['Amount'] = this.amount;
// data['Date'] = this.date;
// data['Description'] = this.description;
// data['MemberId'] = this.memberId;
// return data;
// }
// }

// class TblExpense {
// String? id;
// String? expenseCategoryId;
// dynamic amount;
// String? receipt;
// String? toPay;
// String? remarks;
// String? memberId;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// String? updatedDate;
// UpdatedBy? deletedBy;
// String? deletedDate;
// String? expenseDate;
//
// TblExpense({this.id, this.expenseCategoryId, this.amount, this.receipt, this.toPay, this.remarks, this.memberId, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate, this.expenseDate});
//
// TblExpense.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// expenseCategoryId = json['ExpenseCategoryId'];
// amount = json['Amount'];
// receipt = json['Receipt'];
// toPay = json['ToPay'];
// remarks = json['Remarks'];
// memberId = json['MemberId'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'];
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'];
// expenseDate = json['ExpenseDate'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['ExpenseCategoryId'] = this.expenseCategoryId;
// data['Amount'] = this.amount;
// data['Receipt'] = this.receipt;
// data['ToPay'] = this.toPay;
// data['Remarks'] = this.remarks;
// data['MemberId'] = this.memberId;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// data['UpdatedDate'] = this.updatedDate;
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// data['DeletedDate'] = this.deletedDate;
// data['ExpenseDate'] = this.expenseDate;
// return data;
// }
// }

// class TblIncome {
// String? id;
// String? memberId;
// String? incomeDate;
// dynamic amount;
// String? description;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// String? updatedDate;
// UpdatedBy? deletedBy;
// String? deletedDate;
//
// TblIncome({this.id, this.memberId, this.incomeDate, this.amount, this.description, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate});
//
// TblIncome.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// memberId = json['MemberId'];
// incomeDate = json['IncomeDate'];
// amount = json['Amount'];
// description = json['Description'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] !=  null ? "" : json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy'] !=  null ? "" : json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'];
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['MemberId'] = this.memberId;
// data['IncomeDate'] = this.incomeDate;
// data['Amount'] = this.amount;
// data['Description'] = this.description;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// data['UpdatedDate'] = this.updatedDate;
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// data['DeletedDate'] = this.deletedDate;
// return data;
// }
// }

// class TblShelfLocation {
// String? id;
// String? roomLocationId;
// String? shelfLocationName;
// String? description;
// bool? status;
// bool? isDeleted;
// String? createdBy;
// String? createdDate;
// UpdatedBy? updatedBy;
// UpdatedBy? updatedDate;
// UpdatedBy? deletedBy;
// UpdatedBy? deletedDate;
// String? memberId;
//
// TblShelfLocation({this.id, this.roomLocationId, this.shelfLocationName, this.description, this.status, this.isDeleted, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate, this.deletedBy, this.deletedDate, this.memberId});
//
// TblShelfLocation.fromJson(Map<String, dynamic> json) {
// id = json['Id'];
// roomLocationId = json['RoomLocationId'];
// shelfLocationName = json['ShelfLocationName'];
// description = json['Description'];
// status = json['Status'];
// isDeleted = json['IsDeleted'];
// createdBy = json['CreatedBy'];
// createdDate = json['CreatedDate'];
// updatedBy = json['UpdatedBy'] != null ? new UpdatedBy.fromJson(json['UpdatedBy']) : null;
// updatedDate = json['UpdatedDate'] != null ? new UpdatedBy.fromJson(json['UpdatedDate']) : null;
// deletedBy = json['DeletedBy'] != null ? new UpdatedBy.fromJson(json['DeletedBy']) : null;
// deletedDate = json['DeletedDate'] != null ? new UpdatedBy.fromJson(json['DeletedDate']) : null;
// memberId = json['MemberId'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['Id'] = this.id;
// data['RoomLocationId'] = this.roomLocationId;
// data['ShelfLocationName'] = this.shelfLocationName;
// data['Description'] = this.description;
// data['Status'] = this.status;
// data['IsDeleted'] = this.isDeleted;
// data['CreatedBy'] = this.createdBy;
// data['CreatedDate'] = this.createdDate;
// if (this.updatedBy != null) {
// data['UpdatedBy'] = this.updatedBy!.toJson();
// }
// if (this.updatedDate != null) {
// data['UpdatedDate'] = this.updatedDate!.toJson();
// }
// if (this.deletedBy != null) {
// data['DeletedBy'] = this.deletedBy!.toJson();
// }
// if (this.deletedDate != null) {
// data['DeletedDate'] = this.deletedDate!.toJson();
// }
// data['MemberId'] = this.memberId;
// return data;
// }
// }
