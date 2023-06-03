
part of 'add_home_list_screen_bloc.dart';

abstract class HomeListScreenEvent {}

class HomeListScreenInitialEvent extends HomeListScreenEvent {}

class FetchAllHomeListScreenAPIsEvent extends HomeListScreenEvent {}

class PostCreateHomeEvent extends HomeListScreenEvent{
  final String HomeLocationName;
  final String Description;

  PostCreateHomeEvent(this.HomeLocationName, this.Description);
}