part of 'group_list_screen_bloc.dart';

@immutable
abstract class GroupListScreenEvent {}

class GroupListScreenInitialEvent extends GroupListScreenEvent {}

class FetchAllGroupListScreenAPIsEvent extends GroupListScreenEvent {}
