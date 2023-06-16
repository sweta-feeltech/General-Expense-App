class GetTransactionChartModel {
  List<Income>? income;
  List<Expense>? expense;

  GetTransactionChartModel({this.income, this.expense});

  GetTransactionChartModel.fromJson(Map<String, dynamic> json) {
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

  Income({this.incomeDate, this.totalAmount});

  Income.fromJson(Map<String, dynamic> json) {
    incomeDate = json['incomeDate'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incomeDate'] = this.incomeDate;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class Expense {
  String? expenseDate;
  dynamic totalAmount;

  Expense({this.expenseDate, this.totalAmount});

  Expense.fromJson(Map<String, dynamic> json) {
    expenseDate = json['expenseDate'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['expenseDate'] = this.expenseDate;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}
