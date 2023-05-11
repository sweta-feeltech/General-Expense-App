
part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitialState extends ProfileScreenState {}

class ProfileScreenLoadingEventState extends ProfileScreenState {
  final bool showProgress;

  ProfileScreenLoadingEventState(this.showProgress);
}


class FetchAllProfileScreenAPIsEventState extends ProfileScreenState {
  final GetProfileModel profileDataListModelData;

  FetchAllProfileScreenAPIsEventState(this.profileDataListModelData);
}


class ApiFailureState extends ProfileScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}