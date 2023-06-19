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
  // final List<IncomeListModel> getIncomeListModelData;
  // final List<GetExpenseListModel> getExpenseListModelData;
  final List<GetIncomeListModel> getIncomeListModelData;
  final List<GetExpenseListModel> getExpenseListModelData;
  final GetTransactionChartModel getTransactionChartModel;
  final GetTransactionChartModel2 getTransactionChart2Model;
  // final DashboardModel dashboardModelData;


  // FetchAllIncomeListScreenAPIsEventState(this.getTransactionChartModel,this.getTransactionChart2Model,this.dashboardModelData);
  FetchAllIncomeListScreenAPIsEventState(this.getIncomeListModelData,this.getExpenseListModelData,this.getTransactionChartModel,this.getTransactionChart2Model);
  // FetchAllIncomeListScreenAPIsEventState(this.getIncomeListModelData,this.getExpenseListModelData,this.getTransactionChartModel,this.getTransactionChart2Model,this.dashboardModelData);
}

class FetchChartMonthlyEventState extends IncomeListScreenState {
  final GetTransactionChartModel2 getTransactionChart2Model;
  final List<GetIncomeListModel> getIncomeListModelData;
  final List<GetExpenseListModel> getExpenseListModelData;


  FetchChartMonthlyEventState(this.getTransactionChart2Model,this.getIncomeListModelData,this.getExpenseListModelData);
}


class PostAddIncomeEventState extends IncomeListScreenState {
  final MessageModel addIncomeModelData;

  PostAddIncomeEventState(this.addIncomeModelData);
}