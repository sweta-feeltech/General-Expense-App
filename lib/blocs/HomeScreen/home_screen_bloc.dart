import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/DashboardModel/dashboard_model.dart';
import '../../models/GroupModel/group_list_model.dart';
import '../../network/repository.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';


class HomeScreenBloc
    extends Bloc<HomeScreenEvent, HomeScreenState> {
  final Repository repositoryRepo;

  HomeScreenBloc(this.repositoryRepo)
      : super(HomeScreenInitialState()) {
    on<HomeScreenEvent>((event, emit) async {


      if (event is FetchAllHomeScreenAPIsEvent) {
        late List<GetGroupListModel> getGroupListModelData;
        late DashboardModel dashboardModelData;


        try {
          emit(HomeScreenLoadingEventState(true));
          getGroupListModelData = await repositoryRepo.getGroupModelData();
          dashboardModelData = await repositoryRepo.getDashboardData();
          emit(HomeScreenLoadingEventState(false));
          emit(FetchAllHomeScreenAPIsEventState(getGroupListModelData,dashboardModelData));
        } catch (error, stacktrace) {
          print(stacktrace);
          emit(HomeScreenLoadingEventState(false));
          emit(APIFailureState(Exception(error.toString())));
        }
      }


    });
  }
}
