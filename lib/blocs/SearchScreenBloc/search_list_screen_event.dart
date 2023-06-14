part of 'search_list_screen_bloc.dart';


abstract class SearchListScreenEvent {}

class SearchListScreenInitialEvent extends SearchListScreenEvent {}

class FetchAllSearchListScreenAPIsEvent extends SearchListScreenEvent {
  FetchAllSearchListScreenAPIsEvent();
}

