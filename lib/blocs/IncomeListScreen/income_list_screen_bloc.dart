import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/CommonModel/message_model.dart';
import '../../models/DashboardModel/dashboard_model.dart';
import '../../models/Expense/get_expense_list_model.dart';
import '../../models/Expense/get_transaction_chart_mode2.dart';
import '../../models/Expense/get_transactions_chart_model.dart';
import '../../models/Expense/income_list_model.dart';
import '../../network/repository.dart';

part 'income_list_screen_event.dart';
part 'income_list_screen_state.dart';

class IncomeListScreenBloc extends Bloc<IncomeListScreenEvent, IncomeListScreenState> {
  final Repository repositoryRepo;

  IncomeListScreenBloc(this.repositoryRepo) : super(IncomeListScreenInitialState()) {
    on<IncomeListScreenEvent>((event, emit) async {

      if (event is FetchAllIncomeScreenListScreenAPIsEvent) {
        late List<GetIncomeListModel> getIncomeListModelData;
        late List<GetExpenseListModel> getExpenseListModelData;
        late GetTransactionChartModel getTransactionChartModelData;
        late GetTransactionChartModel2 getTransactionChartModel2Data;
        // late DashboardModel dashboardModelData;

        try {
          emit(IncomeListScreenLoadingEventState(true));
          // getIncomeListModelData = await repositoryRepo.getIncomeListModelData();
          // getExpenseListModelData = await repositoryRepo.getExpenseListModelData();
          getIncomeListModelData = await repositoryRepo.getIncomeChartList(event.chartQuery);
          getExpenseListModelData = await repositoryRepo.getExpenseChartList(event.chartQuery);
          getTransactionChartModelData = await repositoryRepo.getTransactionChart(event.chartQuery);
          getTransactionChartModel2Data = await repositoryRepo.getTransactionChart2(event.chartQuery);
          // dashboardModelData = await repositoryRepo.getDashboardData();
          emit(IncomeListScreenLoadingEventState(false));
          emit(FetchAllIncomeListScreenAPIsEventState(
              // getTransactionChartModelData,getTransactionChartModel2Data,dashboardModelData));
              getIncomeListModelData,getExpenseListModelData,getTransactionChartModelData,getTransactionChartModel2Data));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(IncomeListScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }

      }

      if(event is FetchChartMonthlyEvent){
        late List<GetIncomeListModel> getIncomeListModelData;
        late List<GetExpenseListModel> getExpenseListModelData;
        late GetTransactionChartModel2 getTransactionChartModel2Data;

        try {
          // emit(IncomeListScreenLoadingEventState(true));
          getTransactionChartModel2Data = await repositoryRepo.getTransactionChart2(event.chartQuery2);
          getIncomeListModelData = await repositoryRepo.getIncomeChartList(event.chartQuery2);
          getExpenseListModelData = await repositoryRepo.getExpenseChartList(event.chartQuery2);
          // emit(IncomeListScreenLoadingEventState(false));
          emit(FetchChartMonthlyEventState(getTransactionChartModel2Data,getIncomeListModelData,getExpenseListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          // emit(IncomeListScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }

      }



      if (event is PostAddIncomeEvent) {
        late MessageModel getIncomeListModelData;

        try {
          getIncomeListModelData = await repositoryRepo.addIncomePostAPI(
              {"IncomeDate": event.IncomeDate, "Amount": event.Amount, "Description": event.Description});

          emit(PostAddIncomeEventState(getIncomeListModelData));
        } catch (error) {
          emit(IncomeListScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }




    });
  }
}