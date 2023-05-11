part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenEvent {}

class ProfileScreenInitialEvent extends ProfileScreenEvent {}

class FetchAllProfileScreenScreenAPIsEvent extends ProfileScreenEvent {}