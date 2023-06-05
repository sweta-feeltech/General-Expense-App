part of 'add_shelf_list_screen_bloc.dart';

@immutable
abstract class ShelfListScreenState {}

class ShelfListScreenInitialState extends ShelfListScreenState {}

class ShelfListScreenLoadingEventState extends ShelfListScreenState {
  final bool showProgress;

  ShelfListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends ShelfListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}



class FetchAllShelfListScreenAPIsEventState extends ShelfListScreenState {
  final List<GetShelfListModel> getShelfListModelData;

  FetchAllShelfListScreenAPIsEventState(this.getShelfListModelData);
}

class PostCreateShelfEventState extends ShelfListScreenState{
  final MessageModel messageModelData;

  PostCreateShelfEventState(this.messageModelData);
}
