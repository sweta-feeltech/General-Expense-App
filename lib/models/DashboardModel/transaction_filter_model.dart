class GetFilteredTransactionModel {
  dynamic totalIncome;
  dynamic totalExpense;
  dynamic totalBalance;
  List<IncomeAndExpense1>? incomeAndExpense;

  GetFilteredTransactionModel(
      {this.totalIncome,
        this.totalExpense,
        this.totalBalance,
        this.incomeAndExpense});

  GetFilteredTransactionModel.fromJson(Map<String, dynamic> json) {
    totalIncome = json['totalIncome'];
    totalExpense = json['totalExpense'];
    totalBalance = json['totalBalance'];
    if (json['incomeAndExpense'] != null) {
      incomeAndExpense = <IncomeAndExpense1>[];
      json['incomeAndExpense'].forEach((v) {
        incomeAndExpense!.add(new IncomeAndExpense1.fromJson(v));
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

class IncomeAndExpense1 {
  dynamic amount;
  String? date;
  String? description;
  String? createdDate;
  dynamic transactionType;

  IncomeAndExpense1(
      {this.amount,
        this.date,
        this.description,
        this.createdDate,
        this.transactionType});

  IncomeAndExpense1.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    date = json['date'];
    description = json['description'];
    createdDate = json['createdDate'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['description'] = this.description;
    data['createdDate'] = this.createdDate;
    data['transactionType'] = this.transactionType;
    return data;
  }
}
