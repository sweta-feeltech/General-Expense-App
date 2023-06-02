class DashboardModel {
  dynamic totalIncome;
  dynamic totalExpense;
  dynamic totalBalance;
  List<IncomeAndExpense>? incomeAndExpense;

  DashboardModel(
      {this.totalIncome,
        this.totalExpense,
        this.totalBalance,
        this.incomeAndExpense});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    totalBalance = json['totalBalance'];
    if (json['incomeAndExpense'] != null) {
      incomeAndExpense = <IncomeAndExpense>[];
      json['incomeAndExpense'].forEach((v) {
        incomeAndExpense!.add(new IncomeAndExpense.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalIncome'] = this.totalIncome;
    data['totalExpense'] = this.totalExpense;
    data['totalBalance'] = this.totalBalance;
    if (this.incomeAndExpense != null) {
      data['incomeAndExpense'] =
          this.incomeAndExpense!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncomeAndExpense {
  dynamic amount;
  String? incomeDate;
  String? description;
  String? createdDate;
  String? expenseDate;
  String? remarks;

  IncomeAndExpense(
      {this.amount,
        this.incomeDate,
        this.description,
        this.createdDate,
        this.expenseDate,
        this.remarks});

  IncomeAndExpense.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    incomeDate = json['incomeDate'];
    description = json['description'];
    createdDate = json['createdDate'];
    expenseDate = json['expenseDate'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['incomeDate'] = this.incomeDate;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    data['expenseDate'] = this.expenseDate;
    data['remarks'] = this.remarks;
    return data;
  }
}
