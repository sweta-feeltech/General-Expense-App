part of 'income_list_screen_bloc.dart';

@immutable

abstract class IncomeListScreenEvent {}

class IncomeScreenListInitialEvent extends IncomeListScreenEvent {}

class FetchAllIncomeScreenListScreenAPIsEvent extends IncomeListScreenEvent {}

class PostAddIncomeEvent extends IncomeListScreenEvent {
  final String IncomeDate;
  final String Amount;
  final String Description;

  PostAddIncomeEvent(this.IncomeDate,this.Amount, this.Description);
}