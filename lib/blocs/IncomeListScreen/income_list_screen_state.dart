part of 'income_list_screen_bloc.dart';

@immutable class IncomeListScreenState {}

class IncomeListScreenInitialState extends IncomeListScreenState {}

class IncomeListScreenLoadingEventState extends IncomeListScreenState {
  final bool showProgress;

  IncomeListScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends IncomeListScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class FetchAllIncomeListScreenAPIsEventState extends IncomeListScreenState {
  final List<IncomeListModel> getIncomeListModelData;
  final List<GetExpenseListModel> getExpenseListModelData;
  final GetTransactionChartModel getTransactionChartModel;
  final DashboardModel dashboardModelData;


  FetchAllIncomeListScreenAPIsEventState(this.getIncomeListModelData,this.getExpenseListModelData,this.getTransactionChartModel,this.dashboardModelData);
}


class PostAddIncomeEventState extends IncomeListScreenState {
  final MessageModel addIncomeModelData;

  PostAddIncomeEventState(this.addIncomeModelData);
}