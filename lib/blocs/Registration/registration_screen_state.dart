part of 'registration_screen_bloc.dart';


abstract class RegistrationScreenState {}

class RegistrationScreenInitialState extends RegistrationScreenState {}

class RegistrationScreenLoadingState extends RegistrationScreenState {
  final bool showProgress;

  RegistrationScreenLoadingState(this.showProgress);
}

class PostRegistrationDataEventState extends RegistrationScreenState {
  final LoginModel loginResponseData;
  // final UserProfileData userProfileDataResponse;

  PostRegistrationDataEventState(this.loginResponseData);
}

class APIFailureState extends RegistrationScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}