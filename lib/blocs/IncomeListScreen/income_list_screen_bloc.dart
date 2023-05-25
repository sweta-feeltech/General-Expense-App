import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_expense_app/network/repository.dart';

import '../../models/CommonModel/message_model.dart';
import '../../models/IncomeListModel/income_list_model.dart';

part 'income_list_screen_event.dart';
part 'income_list_screen_state.dart';

class IncomeListScreenBloc extends Bloc<IncomeListScreenEvent, IncomeListScreenState> {
  final Repository repositoryRepo;

  IncomeListScreenBloc(this.repositoryRepo) : super(IncomeListScreenInitialState()) {
    on<IncomeListScreenEvent>((event, emit) async {

      if (event is FetchAllIncomeScreenListScreenAPIsEvent) {
        late List<IncomeListModel> getIncomeListModelData;

        try {
          emit(IncomeListScreenLoadingEventState(true));
          getIncomeListModelData = await repositoryRepo.getIncomeListModelData();
          emit(IncomeListScreenLoadingEventState(false));
          emit(FetchAllIncomeListScreenAPIsEventState(
              getIncomeListModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(IncomeListScreenLoadingEventState(false));
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