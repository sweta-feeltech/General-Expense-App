
part of'add_item_screen_bloc.dart';


@immutable class ItemScreenState {}

class ItemListScreenInitialState extends ItemScreenState {}

class ItemScreenLoadingEventState extends ItemScreenState {
  final bool showProgress;

  ItemScreenLoadingEventState(this.showProgress);
}

class ApiFailureState extends ItemScreenState {
  final Exception exception;

  ApiFailureState(this.exception);
}

class PostAddItemFormEventState extends ItemScreenState {
  final MessageModel messageModelData;

  PostAddItemFormEventState(this.messageModelData);
}