
class GetTransactionChartModel2 {
  dynamic totalIncome;
  dynamic totalExpense;
  List<Income2>? income;
  List<Expense2>? expense;

  GetTransactionChartModel2(
      {this.totalIncome, this.totalExpense, this.income, this.expense});

  GetTransactionChartModel2.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    if (json['income'] != null) {
      income = <Income2>[];
      json['income'].forEach((v) {
        income!.add(new Income2.fromJson(v));
      });
    }
    if (json['expense'] != null) {
      expense = <Expense2>[];
      json['expense'].forEach((v) {
        expense!.add(new Expense2.fromJson(v));
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

class Income2 {
  dynamic weekNumber;
  List<IncomeData>? incomeData;

  Income2({this.weekNumber, this.incomeData});

  Income2.fromJson(Map<String, dynamic> json) {
    weekNumber = json['weekNumber'];
    if (json['incomeData'] != null) {
      incomeData = <IncomeData>[];
      json['incomeData'].forEach((v) {
        incomeData!.add(new IncomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekNumber'] = this.weekNumber;
    if (this.incomeData != null) {
      data['incomeData'] = this.incomeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncomeData {
  String? incomeDate;
  dynamic totalAmount;
  String? description;

  IncomeData({this.incomeDate, this.totalAmount, this.description});

  IncomeData.fromJson(Map<String, dynamic> json) {
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

class Expense2 {
  dynamic weekNumber;
  List<ExpenseData>? expenseData;

  Expense2({this.weekNumber, this.expenseData});

  Expense2.fromJson(Map<String, dynamic> json) {
    weekNumber = json['weekNumber'];
    if (json['expenseData'] != null) {
      expenseData = <ExpenseData>[];
      json['expenseData'].forEach((v) {
        expenseData!.add(new ExpenseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekNumber'] = this.weekNumber;
    if (this.expenseData != null) {
      data['expenseData'] = this.expenseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpenseData {
  String? expenseDate;
  dynamic totalAmount;
  Data? data;

  ExpenseData({this.expenseDate, this.totalAmount, this.data});

  ExpenseData.fromJson(Map<String, dynamic> json) {
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



///
///
/// 3rd
///
///





// class GetTransactionChartModel2 {
//   dynamic totalIncome;
//   dynamic totalExpense;
//   List<Income2>? income;
//   List<Expense2>? expense;
//
//   GetTransactionChartModel2(
//       {this.totalIncome, this.totalExpense, this.income, this.expense});
//
//   GetTransactionChartModel2.fromJson(Map<String, dynamic> json) {
//     totalIncome = json['totalIncome'];
//     totalExpense = json['totalExpense'];
//     if (json['income'] != null) {
//       income = <Income2>[];
//       json['income'].forEach((v) {
//         income!.add(new Income2.fromJson(v));
//       });
//     }
//     if (json['expense'] != null) {
//       expense = <Expense2>[];
//       json['expense'].forEach((v) {
//         expense!.add(new Expense2.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['totalIncome'] = this.totalIncome;
//     data['totalExpense'] = this.totalExpense;
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
// class Income2{
//   dynamic weekNumber;
//   List<IncomeData>? incomeData;
//
//   Income2({this.weekNumber, this.incomeData});
//
//   Income2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['incomeData'] != null) {
//       incomeData = <IncomeData>[];
//       json['incomeData'].forEach((v) {
//         incomeData!.add(new IncomeData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.incomeData != null) {
//       data['incomeData'] = this.incomeData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class IncomeData {
//   String? incomeDate;
//   dynamic totalAmount;
//   String? description;
//
//   IncomeData({this.incomeDate, this.totalAmount, this.description});
//
//   IncomeData.fromJson(Map<String, dynamic> json) {
//     incomeDate = json['incomeDate'];
//     totalAmount = json['totalAmount'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['incomeDate'] = this.incomeDate;
//     data['totalAmount'] = this.totalAmount;
//     data['description'] = this.description;
//     return data;
//   }
// }
//
// class Expense2 {
//   dynamic weekNumber;
//   List<ExpenseData>? expenseData;
//
//   Expense2({this.weekNumber, this.expenseData});
//
//   Expense2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['expenseData'] != null) {
//       expenseData = <ExpenseData>[];
//       json['expenseData'].forEach((v) {
//         expenseData!.add(new ExpenseData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.expenseData != null) {
//       data['expenseData'] = this.expenseData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ExpenseData {
//   String? expenseDate;
//   dynamic totalAmount;
//   Data? data;
//
//   ExpenseData({this.expenseDate, this.totalAmount, this.data});
//
//   ExpenseData.fromJson(Map<String, dynamic> json) {
//     expenseDate = json['expenseDate'];
//     totalAmount = json['totalAmount'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['expenseDate'] = this.expenseDate;
//     data['totalAmount'] = this.totalAmount;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? expenseCategoryName;
//   String? receipt;
//   String? toPay;
//   String? remarks;
//
//   Data({this.expenseCategoryName, this.receipt, this.toPay, this.remarks});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     expenseCategoryName = json['expenseCategoryName'];
//     receipt = json['receipt'];
//     toPay = json['toPay'];
//     remarks = json['remarks'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['expenseCategoryName'] = this.expenseCategoryName;
//     data['receipt'] = this.receipt;
//     data['toPay'] = this.toPay;
//     data['remarks'] = this.remarks;
//     return data;
//   }
// }
//
//
//


///
///
///  2nd Last
///
///
///


// class GetTransactionChartModel2 {
//   dynamic totalIncome;
//   dynamic totalExpense;
//   List<Income2>? income;
//   List<Expense2>? expense;
//
//   GetTransactionChartModel2(
//       {this.totalIncome, this.totalExpense, this.income, this.expense});
//
//   GetTransactionChartModel2.fromJson(Map<String, dynamic> json) {
//     totalIncome = json['totalIncome'];
//     totalExpense = json['totalExpense'];
//     if (json['income'] != null) {
//       income = <Income2>[];
//       json['income'].forEach((v) {
//         income!.add(new Income2.fromJson(v));
//       });
//     }
//     if (json['expense'] != null) {
//       expense = <Expense2>[];
//       json['expense'].forEach((v) {
//         expense!.add(new Expense2.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['totalIncome'] = this.totalIncome;
//     data['totalExpense'] = this.totalExpense;
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
// class Income2 {
//   dynamic weekNumber;
//   List<IncomeData>? incomeData;
//
//   Income2({this.weekNumber, this.incomeData});
//
//   Income2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['incomeData'] != null) {
//       incomeData = <IncomeData>[];
//       json['incomeData'].forEach((v) {
//         incomeData!.add(new IncomeData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.incomeData != null) {
//       data['incomeData'] = this.incomeData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class IncomeData {
//   String? incomeDate;
//   dynamic totalAmount;
//
//   IncomeData({this.incomeDate, this.totalAmount});
//
//   IncomeData.fromJson(Map<String, dynamic> json) {
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
// class Expense2 {
//   dynamic weekNumber;
//   List<ExpenseData>? expenseData;
//
//   Expense2({this.weekNumber, this.expenseData});
//
//   Expense2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['expenseData'] != null) {
//       expenseData = <ExpenseData>[];
//       json['expenseData'].forEach((v) {
//         expenseData!.add(new ExpenseData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.expenseData != null) {
//       data['expenseData'] = this.expenseData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ExpenseData {
//   String? expenseDate;
//   dynamic totalAmount;
//
//   ExpenseData({this.expenseDate, this.totalAmount});
//
//   ExpenseData.fromJson(Map<String, dynamic> json) {
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

///
///
///  OLD
///
///


// class GetTransactionChartModel2 {
//   dynamic totalIncome;
//   dynamic totalExpense;
//   List<Income2>? income;
//   List<Expense2>? expense;
//
//   GetTransactionChartModel2(
//       {this.totalIncome, this.totalExpense, this.income, this.expense});
//
//   GetTransactionChartModel2.fromJson(Map<String, dynamic> json) {
//     totalIncome = json['totalIncome'];
//     totalExpense = json['totalExpense'];
//     if (json['income'] != null) {
//       income = <Income2>[];
//       json['income'].forEach((v) {
//         income!.add(new Income2.fromJson(v));
//       });
//     }
//     if (json['expense'] != null) {
//       expense = <Expense2>[];
//       json['expense'].forEach((v) {
//         expense!.add(new Expense2.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['totalIncome'] = this.totalIncome;
//     data['totalExpense'] = this.totalExpense;
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
// class Income2 {
//   dynamic weekNumber;
//   List<IncomeData>? incomeData;
//
//   Income2({this.weekNumber, this.incomeData});
//
//   Income2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['incomeData'] != null) {
//       incomeData = <IncomeData>[];
//       json['incomeData'].forEach((v) {
//         incomeData!.add(new IncomeData.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.incomeData != null) {
//       data['incomeData'] = this.incomeData!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class IncomeData {
//   String? incomeDate;
//   dynamic totalAmount;
//
//   IncomeData({this.incomeDate, this.totalAmount});
//
//   IncomeData.fromJson(Map<String, dynamic> json) {
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
// class Expense2 {
//   dynamic weekNumber;
//   List<ExpenseDate>? expenseDate;
//
//   Expense2({this.weekNumber, this.expenseDate});
//
//   Expense2.fromJson(Map<String, dynamic> json) {
//     weekNumber = json['weekNumber'];
//     if (json['expenseDate'] != null) {
//       expenseDate = <ExpenseDate>[];
//       json['expenseDate'].forEach((v) {
//         expenseDate!.add(new ExpenseDate.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weekNumber'] = this.weekNumber;
//     if (this.expenseDate != null) {
//       data['expenseDate'] = this.expenseDate!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ExpenseDate {
//   String? expenseDate;
//   dynamic totalAmount;
//
//   ExpenseDate({this.expenseDate, this.totalAmount});
//
//   ExpenseDate.fromJson(Map<String, dynamic> json) {
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
