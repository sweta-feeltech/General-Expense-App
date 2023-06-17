class ChartMonthlyModel {
  int? monthInNumber;
  String? monthInText;

  ChartMonthlyModel(this.monthInNumber, this.monthInText);

  ChartMonthlyModel.fromJson(Map<String, dynamic> json) {
    monthInNumber = json["monthInNumber"];
    monthInText = json["monthInText"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["monthInNumber"] = this.monthInNumber;
    data["monthInText"] = this.monthInText;
    return data;
  }

  @override
  String toString() {
    return "{monthInNumber: $monthInNumber, name: $monthInText}";
  }
}