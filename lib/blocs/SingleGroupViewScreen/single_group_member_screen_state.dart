

part of 'single_group_member_screen_bloc.dart';

@immutable
abstract class SingleGroupViewScreenState {}

class SingleGroupViewScreenInitialState extends SingleGroupViewScreenState {}

class SingleGroupViewScreenLoadingEventState extends SingleGroupViewScreenState {
  final bool showProgress;

  SingleGroupViewScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends SingleGroupViewScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class FetchAllSingleGroupViewScreenAPIsEventState extends SingleGroupViewScreenState {
  final List<GroupMembersModel> groupMemberModelData;

  FetchAllSingleGroupViewScreenAPIsEventState(this.groupMemberModelData);
}


class FetchAllSingleGroupLinkScreenAPIsEventState extends SingleGroupViewScreenState {
  GroupLinkModel? groupLinkModeldata;

  FetchAllSingleGroupLinkScreenAPIsEventState(this.groupLinkModeldata);
}

