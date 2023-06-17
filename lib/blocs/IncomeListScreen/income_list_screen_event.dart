part of 'income_list_screen_bloc.dart';

@immutable

abstract class IncomeListScreenEvent {}

class IncomeScreenListInitialEvent extends IncomeListScreenEvent {}

class FetchAllIncomeScreenListScreenAPIsEvent extends IncomeListScreenEvent {
  final String? chartQuery;
  FetchAllIncomeScreenListScreenAPIsEvent({this.chartQuery});
}



class FetchChartMonthlyEvent extends IncomeListScreenEvent {
  final String? chartQuery2;
  FetchChartMonthlyEvent({this.chartQuery2});
}


class PostAddIncomeEvent extends IncomeListScreenEvent {
  final String IncomeDate;
  final String Amount;
  final String Description;

  PostAddIncomeEvent(this.IncomeDate,this.Amount, this.Description);
}