part of 'expense_screen_bloc.dart';


@immutable class ExpenseScreenState {}

class ExpenseListScreenInitialState extends ExpenseScreenState {}

class ExpenseScreenLoadingEventState extends ExpenseScreenState {
  final bool showProgress;

  ExpenseScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends ExpenseScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class FetchAllExpenseCatListScreenAPIsEventState extends ExpenseScreenState {
  final List<GetExpenseCatModel> getExpenseCatModelData;

  FetchAllExpenseCatListScreenAPIsEventState(this.getExpenseCatModelData);
}

class PostAddExpenseCatEventState extends ExpenseScreenState {
  final AddExpenseCatModel addExpenseCatModelData;

  PostAddExpenseCatEventState(this.addExpenseCatModelData);
}

class FetchAllExpenseListScreenAPIsEventState extends ExpenseScreenState {
  final List<GetExpenseListModel> getExpenseListModelData;

  FetchAllExpenseListScreenAPIsEventState(this.getExpenseListModelData);
}

class PostAddExpenseFormEventState extends ExpenseScreenState {
  final MessageModel messageModelData;

  PostAddExpenseFormEventState(this.messageModelData);
}