part of 'group_list_screen_bloc.dart';

@immutable
abstract class GroupListScreenEvent {}

class GroupListScreenInitialEvent extends GroupListScreenEvent {}

class FetchAllGroupListScreenAPIsEvent extends GroupListScreenEvent {}


class PostCreateGroupEvent extends GroupListScreenEvent {
  final String GroupName;
  final String Description;

  PostCreateGroupEvent(this.GroupName, this.Description);
}


class DeleteGroupEvent extends GroupListScreenEvent{
  final String? id;

  DeleteGroupEvent(this.id);
}
