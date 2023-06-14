part of 'search_list_screen_bloc.dart';


@immutable
abstract class SearchListScreenState {}

class SearchListScreenInitialState extends SearchListScreenState {}

class SearchListScreenLoadingEventState extends SearchListScreenState {
  final bool showProgress;

  SearchListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends SearchListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}



class FetchAllSearchListScreenAPIsEventState extends SearchListScreenState {
  final GetSerachModel? getSerachModelData;

  FetchAllSearchListScreenAPIsEventState(this.getSerachModelData);
}

