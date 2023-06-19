class GetTransactionChartModel {
  dynamic totalIncome;
  dynamic totalExpense;
  List<Income>? income;
  List<Expense>? expense;

  GetTransactionChartModel(
      {this.totalIncome, this.totalExpense, this.income, this.expense});

  GetTransactionChartModel.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    if (json['income'] != null) {
      income = <Income>[];
      json['income'].forEach((v) {
        income!.add(new Income.fromJson(v));
      });
    }
    if (json['expense'] != null) {
      expense = <Expense>[];
      json['expense'].forEach((v) {
        expense!.add(new Expense.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalIncome'] = this.totalIncome;
    data['totalExpense'] = this.totalExpense;
    if (this.income != null) {
      data['income'] = this.income!.map((v) => v.toJson()).toList();
    }
    if (this.expense != null) {
      data['expense'] = this.expense!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Income {
  String? incomeDate;
  dynamic totalAmount;
  String? description;

  Income({this.incomeDate, this.totalAmount, this.description});

  Income.fromJson(Map<String, dynamic> json) {
    incomeDate = json['incomeDate'];
    totalAmount = json['totalAmount'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incomeDate'] = this.incomeDate;
    data['totalAmount'] = this.totalAmount;
    data['description'] = this.description;
    return data;
  }
}

class Expense {
  String? expenseDate;
  dynamic totalAmount;
  Data? data;

  Expense({this.expenseDate, this.totalAmount, this.data});

  Expense.fromJson(Map<String, dynamic> json) {
    expenseDate = json['expenseDate'];
    totalAmount = json['totalAmount'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseDate'] = this.expenseDate;
    data['totalAmount'] = this.totalAmount;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? expenseCategoryName;
  String? receipt;
  String? toPay;
  String? remarks;

  Data({this.expenseCategoryName, this.receipt, this.toPay, this.remarks});

  Data.fromJson(Map<String, dynamic> json) {
    expenseCategoryName = json['expenseCategoryName'];
    receipt = json['receipt'];
    toPay = json['toPay'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseCategoryName'] = this.expenseCategoryName;
    data['receipt'] = this.receipt;
    data['toPay'] = this.toPay;
    data['remarks'] = this.remarks;
    return data;
  }
}



// class GetTransactionChartModel {
//   List<Income>? income;
//   List<Expense>? expense;
//
//   GetTransactionChartModel({this.income, this.expense});
//
//   GetTransactionChartModel.fromJson(Map<String, dynamic> json) {
//     if (json['income'] != null) {
//       income = <Income>[];
//       json['income'].forEach((v) {
//         income!.add(new Income.fromJson(v));
//       });
//     }
//     if (json['expense'] != null) {
//       expense = <Expense>[];
//       json['expense'].forEach((v) {
//         expense!.add(new Expense.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.income != null) {
//       data['income'] = this.income!.map((v) => v.toJson()).toList();
//     }
//     if (this.expense != null) {
//       data['expense'] = this.expense!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Income {
//   String? incomeDate;
//   dynamic totalAmount;
//
//   Income({this.incomeDate, this.totalAmount});
//
//   Income.fromJson(Map<String, dynamic> json) {
//     incomeDate = json['incomeDate'];
//     totalAmount = json['totalAmount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['incomeDate'] = this.incomeDate;
//     data['totalAmount'] = this.totalAmount;
//     return data;
//   }
// }
//
// class Expense {
//   String? expenseDate;
//   dynamic totalAmount;
//
//   Expense({this.expenseDate, this.totalAmount});
//
//   Expense.fromJson(Map<String, dynamic> json) {
//     expenseDate = json['expenseDate'];
//     totalAmount = json['totalAmount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['expenseDate'] = this.expenseDate;
//     data['totalAmount'] = this.totalAmount;
//     return data;
//   }
// }
