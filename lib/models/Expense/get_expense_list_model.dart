
class GetExpenseListModel {
  String? expenseDate;
  dynamic amount;
  String? remarks;
  String? receipt;
  String? toPay;
  String? expenseCategoryName;

  GetExpenseListModel(
      {this.expenseDate,
        this.amount,
        this.remarks,
        this.receipt,
        this.toPay,
        this.expenseCategoryName});

  GetExpenseListModel.fromJson(Map<String, dynamic> json) {
    expenseDate = json['expenseDate'];
    amount = json['amount'];
    remarks = json['remarks'];
    receipt = json['receipt'];
    toPay = json['toPay'];
    expenseCategoryName = json['expenseCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseDate'] = this.expenseDate;
    data['amount'] = this.amount;
    data['remarks'] = this.remarks;
    data['receipt'] = this.receipt;
    data['toPay'] = this.toPay;
    data['expenseCategoryName'] = this.expenseCategoryName;
    return data;
  }
}


// class GetExpenseListModel {
//   String? id;
//   String? expenseCategoryId;
//   String? expenseCategoryName;
//   String? expenseDate;
//   int? amount;
//   String? receipt;
//   String? toPay;
//   String? remarks;
//   String? memberId;
//   String? createdBy;
//   String? createdDate;
//   Null? updatedBy;
//   String? updatedDate;
//
//   GetExpenseListModel(
//       {this.id,
//         this.expenseCategoryId,
//         this.expenseCategoryName,
//         this.expenseDate,
//         this.amount,
//         this.receipt,
//         this.toPay,
//         this.remarks,
//         this.memberId,
//         this.createdBy,
//         this.createdDate,
//         this.updatedBy,
//         this.updatedDate});
//
//   GetExpenseListModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     expenseCategoryId = json['expenseCategoryId'];
//     expenseCategoryName = json['expenseCategoryName'];
//     expenseDate = json['expenseDate'];
//     amount = json['amount'];
//     receipt = json['receipt'];
//     toPay = json['toPay'];
//     remarks = json['remarks'];
//     memberId = json['memberId'];
//     createdBy = json['createdBy'];
//     createdDate = json['createdDate'];
//     updatedBy = json['updatedBy'];
//     updatedDate = json['updatedDate'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['expenseCategoryId'] = this.expenseCategoryId;
//     data['expenseCategoryName'] = this.expenseCategoryName;
//     data['expenseDate'] = this.expenseDate;
//     data['amount'] = this.amount;
//     data['receipt'] = this.receipt;
//     data['toPay'] = this.toPay;
//     data['remarks'] = this.remarks;
//     data['memberId'] = this.memberId;
//     data['createdBy'] = this.createdBy;
//     data['createdDate'] = this.createdDate;
//     data['updatedBy'] = this.updatedBy;
//     data['updatedDate'] = this.updatedDate;
//     return data;
//   }
// }
//
//
//
//
//
//
//
//
// // class GetExpenseListModel {
// //   String? id;
// //   String? expenseCategoryId;
// //   String? expenseCategoryName;
// //   String? expenseDate;
// //   dynamic amount;
// //   String? receipt;
// //   String? toPay;
// //   String? remarks;
// //   String? memberId;
// //   String? createdBy;
// //   String? createdDate;
// //   String? updatedBy;
// //   String? updatedDate;
// //
// //   GetExpenseListModel(
// //       {this.id,
// //         this.expenseCategoryId,
// //         this.expenseCategoryName,
// //         this.expenseDate,
// //         this.amount,
// //         this.receipt,
// //         this.toPay,
// //         this.remarks,
// //         this.memberId,
// //         this.createdBy,
// //         this.createdDate,
// //         this.updatedBy,
// //         this.updatedDate});
// //
// //   GetExpenseListModel.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     expenseCategoryId = json['expenseCategoryId'];
// //     expenseCategoryName = json['expenseCategoryName'];
// //     expenseDate = json['expenseDate'];
// //     amount = json['amount'];
// //     receipt = json['receipt'];
// //     toPay = json['toPay'];
// //     remarks = json['remarks'];
// //     memberId = json['memberId'];
// //     createdBy = json['createdBy'];
// //     createdDate = json['createdDate'];
// //     updatedBy = json['updatedBy'];
// //     updatedDate = json['updatedDate'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['expenseCategoryId'] = this.expenseCategoryId;
// //     data['expenseCategoryName'] = this.expenseCategoryName;
// //     data['expenseDate'] = this.expenseDate;
// //     data['amount'] = this.amount;
// //     data['receipt'] = this.receipt;
// //     data['toPay'] = this.toPay;
// //     data['remarks'] = this.remarks;
// //     data['memberId'] = this.memberId;
// //     data['createdBy'] = this.createdBy;
// //     data['createdDate'] = this.createdDate;
// //     data['updatedBy'] = this.updatedBy;
// //     data['updatedDate'] = this.updatedDate;
// //     return data;
// //   }
// // }