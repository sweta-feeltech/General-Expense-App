part of 'expense_screen_bloc.dart';

@immutable

abstract class ExpenseScreenEvent {}

class ExpenseScreenListInitialEvent extends ExpenseScreenEvent {}

class FetchAllExpenseCatScreenListScreenAPIsEvent extends ExpenseScreenEvent {}

class PostAddExpenseCatEvent extends ExpenseScreenEvent {
  final String ExpenseCategoryName;


  PostAddExpenseCatEvent(this.ExpenseCategoryName);
}

class PostAddExpenseFormEvent extends ExpenseScreenEvent {
  final String ExpenseCategoryId;
  final String ExpenseDate;
  final String Amount;
  final String ToPay;
  final String Remarks;
  final File? Receipt;




  PostAddExpenseFormEvent(this.ExpenseCategoryId,this.ExpenseDate,this.Amount,this.ToPay,this.Remarks,this.Receipt);
}