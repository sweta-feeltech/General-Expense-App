part of 'item_list_screen_bloc.dart';

@immutable
abstract class ItemListScreenState {}

class ItemListScreenInitialState extends ItemListScreenState {}

class ItemListScreenLoadingEventState extends ItemListScreenState {
  final bool showProgress;

  ItemListScreenLoadingEventState(this.showProgress);
}

class APIFailureState extends ItemListScreenState {
  final Exception exception;

  APIFailureState(this.exception);
}



class FetchAllItemListScreenAPIsEventState extends ItemListScreenState {
  final List<GetItemListModel> getItemListModelData;

  FetchAllItemListScreenAPIsEventState(this.getItemListModelData);
}

