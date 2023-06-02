part of 'home_screen_bloc.dart';


@immutable
abstract class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class FetchAllHomeScreenAPIsEvent extends HomeScreenEvent {}


