part of 'add_home_screen_list_bloc.dart';


@immutable
abstract class HomeListScreenState {}

class HomeListScreenInitialState extends HomeListScreenState {}

class HomeListScreenLoadingEventState extends HomeListScreenState {
  final bool showProgress;

  HomeListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends HomeListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}



class FetchAllHomeListScreenAPIsEventState extends HomeListScreenState {
  final List<GetHomeListModel> getHomeListModelData;

  FetchAllHomeListScreenAPIsEventState(this.getHomeListModelData);
}

class PostCreateHomeEventState extends HomeListScreenState{
  final MessageModel messageModelData;

  PostCreateHomeEventState(this.messageModelData);
}
