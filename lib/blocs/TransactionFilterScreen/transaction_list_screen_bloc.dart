
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/models/DashboardModel/transaction_filter_model.dart';

import '../../network/repository.dart';

part  "transaction_list_screen_event.dart";
part  "transaction_list_screen_state.dart";




class SingleGroupViewScreenBloc
    extends Bloc<TrnsacctionListScreenEvent, TrnsacctionListScreenState> {
  final Repository repositoryRepo;

  SingleGroupViewScreenBloc(this.repositoryRepo)
      : super(TrnsacctionListScreenStateScreenInitialState()) {

    on<TrnsacctionListScreenEvent>((event, emit) async {


      if(event is FetchTransactionDataOnFilterEvent) {
        late GetFilteredTransactionModel getFilteredTransactionModelData;
        String queryData;

        if(event.filterStatus == null) {
          queryData = "StartDate=${event.startDate}&EndDate=${event.endDate}";
        }
        else {
          queryData = "StartDate=${event.startDate}&EndDate=${event.endDate}&TransactionType=${event.filterStatus}";
        }

        try {
          getFilteredTransactionModelData = await repositoryRepo.getFilteredTransactionData(dateRangeQuery: queryData);
          emit(FetchRollEntryHeaderDataOnFilterEventState(getFilteredTransactionModelData));
        }
        catch (error) {
          emit(ApiFailureState(Exception(error.toString())));
        }
      }



      }
    );
  }
}
