
part of 'registration_screen_bloc.dart';

abstract class RegistrationScreenEvent {}

class RegistrationScreenInitialEvent extends RegistrationScreenEvent {}

class PostRegistrationDataEvent extends RegistrationScreenEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String passWord;

  PostRegistrationDataEvent(this.firstName,this.lastName,this.email, this.passWord);
}

