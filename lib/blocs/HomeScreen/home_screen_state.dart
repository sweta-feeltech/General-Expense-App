part of 'home_screen_bloc.dart';



@immutable
abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingEventState extends HomeScreenState {
  final bool showProgress;

  HomeScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends HomeScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}


class FetchAllHomeScreenAPIsEventState extends HomeScreenState {
  final List<GetGroupListModel> getGroupListModelData;
  final DashboardModel dashboardModelData;


  FetchAllHomeScreenAPIsEventState(this.getGroupListModelData,this.dashboardModelData);

}
