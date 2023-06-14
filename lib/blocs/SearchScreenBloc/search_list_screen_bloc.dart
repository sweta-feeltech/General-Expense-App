
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/DashboardModel/search_allData_model.dart';
import '../../network/repository.dart';

part 'search_list_screen_event.dart';
part 'search_list_screen_state.dart';


class SearchListScreenBloc
    extends Bloc<SearchListScreenEvent, SearchListScreenState> {
  final Repository repositoryRepo;

  SearchListScreenBloc(this.repositoryRepo)
      : super(SearchListScreenInitialState()) {
    on<SearchListScreenEvent>((event, emit) async {


      if (event is FetchAllSearchListScreenAPIsEvent) {
        late GetSerachModel? getSerachModelData;

        try {
          emit(SearchListScreenLoadingEventState(true));
          getSerachModelData = await repositoryRepo.getSearchData();
          emit(SearchListScreenLoadingEventState(false));
          emit(FetchAllSearchListScreenAPIsEventState(getSerachModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(SearchListScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }


    });
  }
}
