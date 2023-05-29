part of 'expense_screen_bloc.dart';

@immutable

abstract class ExpenseScreenEvent {}

class ExpenseScreenListInitialEvent extends ExpenseScreenEvent {}

class FetchAllExpenseCatScreenListScreenAPIsEvent extends ExpenseScreenEvent {}

class PostAddExpenseCatEvent extends ExpenseScreenEvent {
  final String ExpenseCategoryName;


  PostAddExpenseCatEvent(this.ExpenseCategoryName);
}