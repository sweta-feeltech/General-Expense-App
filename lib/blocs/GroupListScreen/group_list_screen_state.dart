part of 'group_list_screen_bloc.dart';

@immutable
abstract class GroupListScreenState {}

class GroupListScreenInitialState extends GroupListScreenState {}

class GroupListScreenLoadingEventState extends GroupListScreenState {
  final bool showProgress;

  GroupListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends GroupListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}


class FetchAllGroupListScreenAPIsEventState extends GroupListScreenState {
  final List<GetGroupListModel> getGroupListModelData;

  FetchAllGroupListScreenAPIsEventState(this.getGroupListModelData);
}

class PostCreateGroupEventState extends GroupListScreenState {
  final AddGroupModel addGroupModelData;

  PostCreateGroupEventState(this.addGroupModelData);
}

class PostJoinGroupEventState extends GroupListScreenState {
  final AddGroupModel addGroupModelData;

  PostJoinGroupEventState(this.addGroupModelData);
}

class DeleteGroupState extends GroupListScreenState {
  AddGroupModel addGroupModelData1;

  DeleteGroupState(this.addGroupModelData1);
}
