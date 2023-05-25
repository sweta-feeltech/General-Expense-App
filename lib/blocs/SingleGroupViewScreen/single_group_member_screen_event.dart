part of 'single_group_member_screen_bloc.dart';

@immutable
abstract class SingleGroupViewScreenEvent {}

class SingleGroupViewScreenInitialEvent extends SingleGroupViewScreenEvent {}

class FetchAllSingleGroupViewScreenAPIsEvent
    implements SingleGroupViewScreenEvent {
  final String grpQuery;

  FetchAllSingleGroupViewScreenAPIsEvent(this.grpQuery);
}

// class FetchAllSingleGroupLinkScreenAPIsEvent implements SingleGroupViewScreenEvent {
//
//   final String lnkQuery;
//
//   FetchAllSingleGroupLinkScreenAPIsEvent(this.lnkQuery);
//
// }
