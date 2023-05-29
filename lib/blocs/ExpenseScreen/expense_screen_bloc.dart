import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Category/add_expense_category_model.dart';
import '../../models/Category/get_expense_category_model.dart';
import '../../network/repository.dart';

part 'expense_screen_state.dart';
part 'expense_screen_event.dart';

class ExpenseScreenBloc extends Bloc<ExpenseScreenEvent, ExpenseScreenState> {
  final Repository repositoryRepo;

  ExpenseScreenBloc(this.repositoryRepo) : super(IncomeListScreenInitialState()) {
    on<ExpenseScreenEvent>((event, emit) async {

      if (event is FetchAllExpenseCatScreenListScreenAPIsEvent) {
        late List<GetExpenseCatModel> getExpenseCatModelData;

        try {
          emit(ExpenseScreenLoadingEventState(true));
          getExpenseCatModelData = await repositoryRepo.getExpenseCatModelData();
          emit(ExpenseScreenLoadingEventState(false));
          emit(FetchAllExpenseCatListScreenAPIsEventState(
              getExpenseCatModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(ExpenseScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }

      }

      if (event is PostAddExpenseCatEvent) {
        late AddExpenseCatModel getExpenseCatModelData;

        try {
          getExpenseCatModelData = await repositoryRepo.addExpenseCatModelData(
              {"ExpenseCategoryName": event.ExpenseCategoryName,});

          emit(PostAddExpenseCatEventState(getExpenseCatModelData));
        } catch (error) {
          emit(ExpenseScreenLoadingEventState(false));
          emit(ApiFailureState(Exception(error.toString())));
        }
      }

    });
  }
}