part of 'group_list_screen_bloc.dart';

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


class PostCreateGroupEventState extends GroupListScreenState {
  final AddGroupModel addGroupModelData;

  PostCreateGroupEventState(this.addGroupModelData);
}


