part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent {}

class LoginScreenInitialEvent extends LoginScreenEvent {}

class PostLoginDataEvent extends LoginScreenEvent {
  final String email;
  final String passWord;

  PostLoginDataEvent(this.email, this.passWord);
}