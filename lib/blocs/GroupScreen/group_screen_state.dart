part of 'group_screen_bloc.dart';

@immutable
abstract class GroupListScreenState {}

class GroupListScreenInitialState extends GroupListScreenState {}

class GroupListScreenLoadingEventState extends GroupListScreenState {
  final bool showProgress;

  GroupListScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends GroupListScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class FetchAllGroupListScreenAPIsEventState extends GroupListScreenState {
  final List<GetGroupListModel> getGroupListModelData;

  FetchAllGroupListScreenAPIsEventState(this.getGroupListModelData);
}
