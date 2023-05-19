part of 'group_list_screen_bloc.dart';

@immutable
abstract class GroupListScreenEvent {}

class GroupListScreenInitialEvent extends GroupListScreenEvent {}

class FetchAllGroupListScreenAPIsEvent extends GroupListScreenEvent {}


class PostCareateGroupEvent extends GroupListScreenEvent {
  final String GroupName;
  final String Description;

  PostCareateGroupEvent(this.GroupName, this.Description);
}
