part of 'login_screen_bloc.dart';


abstract class LoginScreenState {}

class LoginScreenInitialState extends LoginScreenState {}

class LoginScreenLoadingState extends LoginScreenState {
  final bool showProgress;

  LoginScreenLoadingState(this.showProgress);
}

class PostLoginDataEventState extends LoginScreenState {
  final LoginModel loginResponseData;
  // final UserProfileData userProfileDataResponse;

  PostLoginDataEventState(this.loginResponseData);
}

class APIFailureState extends LoginScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}