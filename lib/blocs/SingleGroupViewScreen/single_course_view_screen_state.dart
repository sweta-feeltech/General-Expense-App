

part of 'single_course_view_screen_bloc.dart';

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
  final List<SingleGroupViewModel> singleGroupViewModelData;

  FetchAllSingleGroupViewScreenAPIsEventState(this.singleGroupViewModelData);
}
